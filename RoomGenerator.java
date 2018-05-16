/**
 *=========================================================
 * RoomGenerator.java
 *
 * Created by: Nico Poblete/boaromayo/Quesada's Swan
 *
 * Initial release: 2018-05-16
 *
 * Initial commit: 2018-05-16
 *
 * Updated: 2018-05-16
 *
 * Changelog:
 *	- Initial commit - 2018-05-16
 *  - Started - 2018-05-15
 *---------------------------------------------------------
 * This generates one Zelda-esque dungeon room based on a 
 * given width and height.
 * Adjusting certain parameters using integers corresponding
 * to certain tiles, a room can be created.
 * The output is shown on the console, then is saved to an
 * arbitrary text file.
 *=========================================================
**/
import java.io.*;
import java.util.*;

public class RoomGenerator {

	// INPUT VARIABLES.
	private String mapname;
	private int width, height;

	// TILE PARAMETERS. Add more tiles if needed.
	private static final int LIMIT = 13;
	private static final int BLANK = 0;
	private static final int FLOOR = 1;
	private static final int BLOCK = 10;
	private static final int WATER = 11;
	//private static final int LAVA = 12;
	private static final int WALL_TOP = 2;
	private static final int WALL_BOTTOM = 3;
	private static final int WALL_LEFT = 4;
	private static final int WALL_RIGHT = 5;
	private static final int CORNER_ONE = 6;
	private static final int CORNER_TWO = 7;
	private static final int CORNER_THREE = 8;
	private static final int CORNER_FOUR = 9;
	private int[] TILES = {FLOOR, WATER, FLOOR, FLOOR,
		FLOOR, BLOCK, FLOOR};

	// SETTINGS.
	private boolean isCSVFile = false;

	// ROOM.
	private int[][] room;

	public RoomGenerator() {
		inputGenerator();
	}


	public void inputGenerator() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Write name of map, width, and height:");
		mapname = scanner.nextLine();
		width = scanner.nextInt();
		height = scanner.nextInt();

		room = new int[height][width];

		generate();
		print();

		scanner.close();

		// Uncomment this code if console output works.
		try {
			writeToFile();
		} catch(Exception e) {
			System.err.println("ERROR: " + e.getMessage());
			e.printStackTrace();
		}
	}

	public void generate() {
		Random rand = new Random();
		int mid; // midpoint of map
		int i, r, c;
		boolean top, bottom, left, right;
		boolean hasPassageNorth, hasPassageWest, hasPassageEast, hasPassageSouth;

		hasPassageNorth = (rand.nextInt(LIMIT+1) % 2 == 0);
		hasPassageWest = (rand.nextInt(LIMIT+1) % 6 == 0);
		hasPassageEast = (rand.nextInt(LIMIT+1) % 8 == 0);
		hasPassageSouth = (rand.nextInt(LIMIT+1) % 4 == 0);

		for (i = 0; i < width*height; i++) {
			r = i / width;
			c = i % width;

			top = (r == 0);
			bottom = (r == height-1);
			left = (c == 0);
			right = (c == width-1);
			
			// Check when on the edges of the room.
			// If so, draw in the integers for the WALLs and CORNERs.
			if (top) {
				if (left) {
					room[r][c] = CORNER_ONE;
				} else if (right) {
					room[r][c] = CORNER_TWO;
				} else {
					room[r][c] = WALL_TOP;
				}
			}

			else if (bottom) {
				if (left) {
					room[r][c] = CORNER_THREE;
				} else if (right) {
					room[r][c] = CORNER_FOUR;
				} else {
					room[r][c] = WALL_BOTTOM;
				}	
			}

			else {
				if (left) {
					room[r][c] = WALL_LEFT;
				} else if (right) {
					room[r][c] = WALL_RIGHT;
				} else {
					room[r][c] = 
						TILES[rand.nextInt(LIMIT+1) % TILES.length];
				}
			}
		}

		// If a passage is made available, 
		// replace walls with floor.
		if (hasPassageNorth) {
			mid = (int)width/2;
			room[0][mid] = FLOOR;
			room[0][mid+1] = FLOOR;
		}

		if (hasPassageWest) {
			mid = (int)height/2;
			room[mid][0] = FLOOR;
			room[mid+1][0] = FLOOR;
		}

		if (hasPassageEast) {
			mid = (int)height/2;
			room[mid][width-1] = FLOOR;
			room[mid+1][width-1] = FLOOR;
		}

		if (hasPassageSouth) {
			mid = (int)width/2;
			room[height-1][mid] = FLOOR;
			room[height-1][mid+1] = FLOOR;
		}
	}

	public void print() {
		int i, r, c;
		boolean top, left;

		for (i = 0; i < width*height; i++) {
			r = i / width;
			c = i % width;

			top = (r == 0);
			left = (c == 0);

			// Go to next row when column resets
			if (!top && left) {
				System.out.println();
			}

			if (isCSVFile) {
				System.out.print(room[r][c] + ",");
			} else {
				System.out.print(room[r][c] + " ");
			}
		}
	}
	public void writeToFile() throws FileNotFoundException {
		String filename = mapname + ".txt";
		File output = new File(filename);
		PrintWriter writer = new PrintWriter(output);
		int i, r, c;
		boolean top, left, edge;

		for (i = 0; i < width*height; i++) {
			r = i / width;
			c = i % width;

			top = (r == 0);
			left = (c == 0);
			edge = (c == width-1);

			if (!top && left) {
				writer.println();
			}

			// Don't leave whitespace at right edge of room
			if (edge) {
				writer.print(room[r][c]);
				continue;
			}

			if (isCSVFile) {
				writer.print(room[r][c] + ",");
			} else {
				writer.print(room[r][c] + " ");
			}
		}

		writer.flush();
		writer.close();
	}

	public static void main(String[] args) {
		new RoomGenerator();
	}
}