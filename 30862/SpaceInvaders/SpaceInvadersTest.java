import java.awt.*;
import java.awt.event.KeyEvent;
import java.lang.Thread;

import com.brackeen.javagamebook.graphics.*;
import com.brackeen.javagamebook.input.*;
import com.brackeen.javagamebook.test.GameCore;

/**
	MAIN FILE TO RUN FOR SPACE INVADERS GAME
		
*/
public class SpaceInvadersTest extends GameCore {

	public static void main(String[] args) {
		new SpaceInvadersTest().run();
	}
	
	protected GameAction shoot; 
	protected GameAction exit;
	protected GameAction moveLeft;
	protected GameAction moveRight;
	
	//NEW ACTIONS
	protected GameAction moveUp;
	protected GameAction moveDown;
	
	protected GameAction pause;
	protected InputManager inputManager;
	private Defender defender;
	private Controller controller;
	private Image bgImage;
	private boolean paused;
	public static final float SCREEN_WIDTH = 800;
	public static final float SCREEN_HEIGHT = 600;

	public void init() {
		super.init();
		Window window = screen.getFullScreenWindow();
		inputManager = new InputManager(window);
		createGameActions();
		createSprite();
		paused = false;
		
		//PRINT ALL CUSTOM VALUES::
		System.out.println("INVADER ROWS: " + SelectFeatures.INVADER_ROWS);
		System.out.println("INVADER COLUMNS " + SelectFeatures.INVADER_COLUMNS); 
		System.out.println("INVADER MOVE RATE: " + SelectFeatures.INVADER_MOVE_RATE);
		System.out.println("INVADER DROP RATE: " + SelectFeatures.INVADER_DROP_RATE);
		System.out.println("INVADER FIRE RATE: " + SelectFeatures.INVADER_FIRE_RATE);
		System.out.println("DEFENDER LIVES: " + SelectFeatures.DEFENDER_LIVES);
		
		//Start background music:
		Thread t3 = new Thread(new BackgroundMusic("bgmusic.wav"));
		t3.start();
		
	}


	/**
		Tests whether the game is paused or not.
	*/
	public boolean isPaused() {
		return paused;
	}


	/**
		Sets the paused state.
	*/
	public void setPaused(boolean p) {
		if (paused != p) {
			this.paused = p;
			inputManager.resetAllGameActions();
		}
	}


	public void update(long elapsedTime) {
		// check if user is trying to pause/unpause or exit
		checkSystemInput();
		
		// if game isnt paused, check for input and update all sprites
		if (!isPaused()) {
			checkGameInput();
			defender.update(elapsedTime);
			controller.update(elapsedTime,defender);
			defender.lives = controller.defenderHit(defender);
		}
	}


	/**
		Checks input from GameActions that can be pressed
		regardless of whether the game is paused or not.
	*/
	public void checkSystemInput() {
		if (pause.isPressed()) {
			setPaused(!isPaused());
		}
		if (exit.isPressed()) {
			stop();
		}
	}


	/**
		Checks input from GameActions that can be pressed
		only when the game is not paused.
	*/
	public void checkGameInput() {
		float velocityX = 0;
		if (moveLeft.isPressed() && defender.getX() > 0) {
			velocityX-=Defender.SPEED;
		}
		if (moveRight.isPressed() && defender.getX() + defender.getWidth() < screen.getWidth()){
			velocityX+=Defender.SPEED;
		}
		float velocityY = 0;
		if (moveUp.isPressed() && defender.getY() > 0) {
			velocityY-=Defender.SPEED;
		}
		if (moveDown.isPressed() && defender.getY() + defender.getHeight() < screen.getHeight()){
			velocityY+=Defender.SPEED;
		}
		
		defender.setVelocityX(velocityX);c
		defender.setVelocityY(velocityY);
		
		// If shoot is pressed and Defender is alive
		if (shoot.isPressed() && defender.getState() != Defender.DEAD)
		{
			Image player2 = loadImage("images/bullet.png");
			Animation anim2 = new Animation();
			anim2.addFrame(player2, 750);
			
			controller.addBullet(new Bullet(-.5f,defender.getX() + 40,defender.getY(),anim2));
			
			Thread t1 = new Thread(new SimpleSoundPlayer("bullet.wav"));
			t1.start();
			
		}
		
	}


	public void draw(Graphics2D g) {
		// draw background
		g.drawImage(bgImage, 0, 0, null);

		// draw sprite
		defender.draw(g);
			
		//Draw bullets and enemies
		controller.draw(g);
		
		g.setColor(Color.white);
		g.drawString("LIVES: "+defender.lives,700,30);
		
		if (defender.lives <= 0){
			g.setFont(new Font("TimesRoman", Font.BOLD, 72)); 
			g.drawString("GAME OVER!",200,200);
			setPaused(true);
		}
		
	}


	/**
		Creates GameActions such as move,shoot,and pause and maps them to keys.
	*/
	public void createGameActions() {
		shoot = new GameAction("shoot", GameAction.DETECT_INITAL_PRESS_ONLY);
		exit = new GameAction("exit", GameAction.DETECT_INITAL_PRESS_ONLY);
		moveLeft = new GameAction("moveLeft");
		moveRight = new GameAction("moveRight");
		moveUp = new GameAction("moveUp");
		moveDown = new GameAction("moveDown");
		pause = new GameAction("pause",GameAction.DETECT_INITAL_PRESS_ONLY);
			
		//exit with esc key and pause with 'P' key
		inputManager.mapToKey(exit, KeyEvent.VK_ESCAPE);
		inputManager.mapToKey(pause, KeyEvent.VK_P);

		// shoot with spacebar or mouse button
		inputManager.mapToKey(shoot, KeyEvent.VK_SPACE);
		
		// move with the arrow keys
		inputManager.mapToKey(moveLeft, KeyEvent.VK_LEFT);
		inputManager.mapToKey(moveRight, KeyEvent.VK_RIGHT);
		inputManager.mapToKey(moveUp, KeyEvent.VK_UP);
		inputManager.mapToKey(moveDown, KeyEvent.VK_DOWN);

	}


	/**
		Load images and creates the Player sprite.
	*/
	private void createSprite() {
		// load images of background and defender
		bgImage = loadImage("images/background.jpg");
		Image player1 = loadImage("images/defender.png");

		// create Defender animation and place him on the floor of the screen
		Animation anim1 = new Animation();
		anim1.addFrame(player1, 750);
		defender = new Defender(anim1);
		defender.setFloorY(screen.getHeight() - defender.getHeight());
		
		//creates invaders and barriers in the Controller class
		controller = new Controller();
		controller.createInvaders();
		controller.createBarriers();
	}

}
