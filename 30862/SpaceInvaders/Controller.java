//
// Controller
// Created by Kushol Bhattacharjee on 11/19/17.
import java.util.LinkedList;
import java.awt.*;
import java.awt.event.KeyEvent;
import javax.swing.ImageIcon;

import com.brackeen.javagamebook.graphics.*;
import com.brackeen.javagamebook.input.*;
import com.brackeen.javagamebook.test.GameCore;
import java.util.Random;
import java.util.*;

public class Controller {
	
	private LinkedList<Bullet> b = new LinkedList<Bullet>();
	private LinkedList<Bomb> bombs = new LinkedList<Bomb>();
	private ArrayList<ArrayList<Invader>> e = new ArrayList<ArrayList<Invader>>(); 
	Barrier[] barriers = new Barrier[3];
	
	Random r = new Random();
	
	Bullet TempBullet;
	Bomb TempBomb;
	Invader TempInvader;
	private int BombCounter = 0;
	public int score = 0;
	public int lives = 0;
	
	
	public void createInvaders(){
		// Create the invaders as a 2D Matrix with each column containing 
		// an array for the invaders in every row 
		int x,y;
		x = y = 0;
		for( int cols = 0; cols < SelectFeatures.INVADER_COLUMNS; cols++) {
			e.add(new ArrayList<Invader>());
			y = 0;
			for( int rows = 0; rows < SelectFeatures.INVADER_ROWS; rows++) {
				Image invaderImg = loadImage("images/invader.png");
				Animation invaderAnim = new Animation();
				invaderAnim.addFrame(invaderImg, 750);
				e.get(cols).add(new Invader(x,y,invaderAnim));
				y += e.get(0).get(0).getHeight();
			}
			x += e.get(0).get(0).getWidth();
		}
	}
	
	public void createBarriers(){
		Image qImg = loadImage("images/quarter.png");
		Animation qAnim = new Animation();
		qAnim.addFrame(qImg, 750);
		
		barriers[0] = new Barrier(100,300,qAnim);
		barriers[1] = new Barrier(350,300,qAnim);
		barriers[2] = new Barrier(600,300,qAnim);
	}
	
	
	/* 
	UPDATE FUNCTION FOR ALL COLLISIONS 
	*/
	public void update(long elapsedTime, Defender defender){
		
		// Create Bomb once the rate is met (Set in SelectFeatures)
		BombCounter++;
		int col = r.nextInt(e.size());
		if (BombCounter % (500/SelectFeatures.INVADER_FIRE_RATE) == 0 && e.get(col).size() != 0){
			System.out.println("" + SelectFeatures.INVADER_FIRE_RATE);
			Image bombImg = loadImage("images/bomb.png");
			Animation bombAnim = new Animation();
			bombAnim.addFrame(bombImg, 750);
			TempInvader = e.get(col).get(e.get(col).size()-1);
			bombs.add(new Bomb(TempInvader.getX() + 40,TempInvader.getY() + 60,bombAnim));
			
			new Thread(new SimpleSoundPlayer("bomb.wav")).start();
		}
		
		//If bombs hit bottom of screen delete them
		//Otherwise update bomb
		for(int i = 0; i < bombs.size(); i++){
			TempBomb = bombs.get(i);
			
			if(TempBomb.getY() > SpaceInvadersTest.SCREEN_HEIGHT){
				removeBomb(TempBomb);
			}
			else{
				TempBomb.update(elapsedTime);
			}
		}
		
		
		//If bullets hit top of screen delete them
		//Otherwise update bullet
		for(int i = 0; i < b.size(); i++){
			TempBullet = b.get(i);
			
			if(TempBullet.getY() < 0){
				removeBullet(TempBullet);
			}
			else{
				TempBullet.update(elapsedTime);
			}		
		}
		
		//See if Invaders are hitting edge
		boolean hitEdge = false;
		for (int i = 0; i < e.size(); i++) {
			if (e.get(i).size() > 0){
				TempInvader = e.get(i).get( e.get(i).size() - 1 );
				if (TempInvader.hitEdge()){
					hitEdge = true;
					break;
				}
			}
		}
		
		//Remove invader and bullet if collision
		//ELSE update invader
		for(int r = 0; r < e.size(); r++){
			for(int c = 0; c < e.get(r).size(); c++){
				int hit = 0;
				TempInvader = e.get(r).get(c);
				
				// Check for collision between any Invader and defender
				if (Physics.collision(TempInvader,defender)){
					defender.lives -= 1;
				}
				
				//remove Bullet and Invader if collision
				for(int j = 0; j < b.size(); j++){
					TempBullet = b.get(j);
					if(Physics.collision(TempInvader,TempBullet)){
						hit = 1;
						e.get(r).remove(c);
						b.remove(j);
						score++;
						break;
					}
				}
				// else update the invader as normal
				if (hit == 0){
					TempInvader.update(elapsedTime,hitEdge);
				}	
			}
		}
		
		//KILL BARRIER IF INTERSECTION with any bullets or bombs
		for(int j = 0; j < 3; j++){
			//for every quarter
			for (int k = 0; k < barriers[j].length(); k++){
				
				//bullets collision with barrier
				for(int i = 0; i < b.size(); i++){
					if (Physics.collision(barriers[j].getQuarter(k),b.get(i))){
						//barriers[j].removeQuarter(k);
						removeBullet(b.get(i));
					}
				}
				
				//bombs collision with barrier
				for(int i = 0; i < bombs.size(); i++){
					if (Physics.collision(barriers[j].getQuarter(k),bombs.get(i))){
						barriers[j].removeQuarter(k);
						removeBomb(bombs.get(i));
					}
				}
			} 
		}
		
		
	}
	
	public void draw(Graphics g){
		//draw bullets
		for(int i = 0; i < b.size(); i++){
			TempBullet = b.get(i);
			
			TempBullet.draw(g);
		}
		
		//draw barriers
		barriers[0].draw(g);
		barriers[1].draw(g);
		barriers[2].draw(g);
		
		//draw invaders
		for(int r = 0; r < e.size(); r++){
			for(int c = 0; c < e.get(r).size(); c++){
				e.get(r).get(c).draw(g);
				//System.out.println(r + " " + c);
			}
		}
		
		//draw bombs
		for(int i = 0; i < bombs.size(); i++){
			TempBomb = bombs.get(i);
			
			TempBomb.draw(g);
		}
		
		//draw score and lives
		g.setColor(Color.white);
		g.drawString("SCORE: "+score,10,30);
		
	}
	
	public void addBullet(Bullet block){
		b.add(block);
	}
	
	public void removeBullet(Bullet block){
		b.remove(block);
	}
	
	public Image loadImage(String fileName) {
		return new ImageIcon(fileName).getImage();
	}
	
	public void addBomb(Bomb block){
		bombs.add(block);
	}
		
	public void removeBomb(Bomb block){
		bombs.remove(block);
	}
	
	public int defenderHit(Defender d){
		for (int i = 0; i < bombs.size(); i++){
			if (Physics.collision(d,bombs.get(i))){
				removeBomb(bombs.get(i));
				return --d.lives;
			}

		}
		return d.lives; 
	}
	
}





