//
// Barrier
// Created by Kushol Bhattacharjee on 11/19/17.

import java.awt.*;
import java.awt.event.KeyEvent;
import java.util.*;

import com.brackeen.javagamebook.graphics.*;
import com.brackeen.javagamebook.input.*;
import com.brackeen.javagamebook.test.GameCore;

public class Barrier {	
	
	private ArrayList<Quarter> quarters = new ArrayList<Quarter>();
	public float x;
	public float y;
	
	public Barrier(float xCoord, float yCoord, Animation qAnim){
		x = xCoord;
		y = yCoord;
		
		quarters.add( new Quarter(xCoord, yCoord, qAnim) ); //topLeft (index 0)
		quarters.add( new Quarter(xCoord + 50, yCoord, qAnim) );	//topRight (index 1)
		quarters.add( new Quarter(xCoord, yCoord + 50, qAnim) );	//bottomLeft (index 2)
		quarters.add( new Quarter(xCoord + 50, yCoord + 50, qAnim) );	//bottomRight (index 3)
	}
	
	public void draw(Graphics g){
		//System.out.println("Drawing Bullet");
		for (int q = 0; q<quarters.size(); q++){
			quarters.get(q).draw(g);
		}
	}
	
	public void removeQuarter(int i){
		quarters.remove(i);
	}
	
	public Quarter getQuarter(int i){
		return quarters.get(i);
	}
	
	public int length(){
		return quarters.size();
	}	
	
	
	public class Quarter extends Sprite {
		
		public Quarter(float xCoord, float yCoord, Animation anim) {
			super(anim);
			setX(xCoord);
			setY(yCoord);
		}
		
		public void draw(Graphics g){
			//System.out.println("Drawing Bullet");
			g.drawImage(anim.getImage(), Math.round(getX()), Math.round(getY()), null);
		}
		
	}	
	
}

