#ifndef GRADIENT_H
#define GRADIENT_H

#define RGB_MAX 255

class Gradient {
	public:
		Gradient();
		~Gradient();
		
		int red();
		int green();
		int blue();
		
		int getWidth() const;
		int getHeight() const;
		
		void print();
	
	private:
		// size of gradient.
		int width;
		int height;
	
		// Starting colors for gradient.
		int redstart;
		int grnstart;
		int blustart;
		
		// Ending colors for gradient.
		int redend;
		int grnend;
		int bluend;
};

#endif
