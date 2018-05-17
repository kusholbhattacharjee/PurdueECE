import java.awt.*;
import java.awt.event.KeyEvent;

import com.brackeen.javagamebook.graphics.*;
import com.brackeen.javagamebook.input.*;
import com.brackeen.javagamebook.test.GameCore;

/**
	The Defender extends the Sprite class and has these abilities:
	 - Move Left and Right 
	 - One shot per space button push 
	 - Loses 1 life when hit by Invader's bomb
	 - Dies when hit by Invader
*/
public class Defender extends Sprite {

	public static final int ALIVE = 0;
	public static final int DEAD = 1;

	public static final float SPEED = .3f;

	private int floorY;
	private int state;
	public int lives = SelectFeatures.DEFENDER_LIVES;
	
	public Defender(Animation anim) {
		super(anim);
		state = ALIVE;
	}


	// get current # of lives 
	public int getLives(){
		return lives;
	}
	
	// sets the number of lives 
	public void setLives(int life){
		this.lives = life;
	}
	
	
	// Gets the state of the Player (either ALIVE or DEAD)	
	public int getState() {
		return state;
	}


	// Sets the state of the Player
	public void setState(int state) {
		this.state = state;
	}


	// Sets the location of "floor" (bottom of the screen)
	public void setFloorY(int floorY) {
		this.floorY = floorY;
		setY(floorY);
	}

	// Updates the player's positon and animation. 
	public void update(long elapsedTime) {
		// move player
		super.update(elapsedTime);	
	}
	
	// Draws the sprite on the screen, also takes a life away everytime state is "DEAD"
	public void draw(Graphics g){
		if (getState() == DEAD){
			this.lives-=1;
		}
		g.drawImage(getImage(),Math.round(getX()),Math.round(getY()),null);
	}
}







