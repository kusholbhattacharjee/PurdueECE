//
// Bullet
// Created by Kushol Bhattacharjee on 11/19/17.

import java.awt.*;
import java.awt.event.KeyEvent;

import com.brackeen.javagamebook.graphics.*;
import com.brackeen.javagamebook.input.*;
import com.brackeen.javagamebook.test.GameCore;

public class Bullet extends Sprite{	
	
	// Initialize Bullet
	public Bullet(float vel, float xCoord, float yCoord, Animation anim){
		super(anim);
		setVelocityY(vel);
		setX(xCoord);
		setY(yCoord);
	}
	
	// Draw Bullet
	public void draw(Graphics g){
		g.drawImage(anim.getImage(), Math.round(getX()), Math.round(getY()), null);
	}
	
	// Update Bullet with Y velocity
	public void update(long elapsedTime) {
		setY( getY() + ( getVelocityY() * elapsedTime ) );
	}
	
}