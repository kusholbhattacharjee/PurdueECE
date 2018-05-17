import java.io.*;
import javax.sound.sampled.*;

/**
	The SimpleSoundPlayer encapsulates a sound that can be opened
	from the file system and later played.
*/
public class BackgroundMusic implements Runnable  {

	private AudioFormat format;
	private byte[] samples;
	private String filename;

	/**
		Opens a sound from a file.
	*/
	
	public BackgroundMusic(String file){
		filename = file;
	}
	
	public void run(){
		while (true){
			// load a sound
			SimpleSoundPlayer sound =
					new SimpleSoundPlayer(filename);

				// create the stream to play
			InputStream stream =
					new ByteArrayInputStream(sound.getSamples());

			// play the sound
			sound.play(stream);
		}
	}

}