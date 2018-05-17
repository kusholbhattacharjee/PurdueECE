//
// Bullet
// Created by Kushol Bhattacharjee on 11/19/17.

import java.awt.*;
import java.awt.event.KeyEvent;

import com.brackeen.javagamebook.graphics.*;
import com.brackeen.javagamebook.input.*;
import com.brackeen.javagamebook.test.GameCore;

public class Bomb extends Sprite{	
	
	public Bomb(float xCoord, float yCoord, Animation anim){
		super(anim);
		setVelocityY(.2f);
		setX(xCoord);
		setY(yCoord);
	}
	
	public void draw(Graphics g){
		//System.out.println("Drawing Bomb");
		g.drawImage(anim.getImage(), Math.round(getX()), Math.round(getY()), null);
	}
	
	public void update(long elapsedTime) {
		//System.out.println("position is " + getY());
		setY( getY() + ( getVelocityY() * elapsedTime ) );
	}
	
}