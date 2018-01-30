//=============================================================================
// ScanWindow.js
//=============================================================================

/*:
 * @plugindesc Scan window processing in battle. Scan window sees stats of enemy or ally.
 * @author boaromayo/Nico Poblete
 *
 * @param scannable
 * @desc If true, enemy can be scanned.
 * @default on
 *
 * @help
 *
 * If using this plugin on your projects (commercial or non-commercial),
 * be sure to credit me as either boaromayo, Quesada's Swan, or Nico Poblete
 * in your game.
 *
 * Can also be able to add info scanned from enemy 
 * and add into bestiary if available.
 * 
 * Plugin Commands:
 *  Scan on				# Turn on scan window.
 *  Scan add 			# Add target enemy once scanned.
 *
 * Plugin Note:
 *  <enemy:foobar> 		# Target of enemy being scanned.
 *	<add_enemy:no>		# Add enemy into enemy book if available. 
*/

(function() {

	var _Game_Interpreter_plugin_command = 
		Game_Interpreter.prototype.pluginCommand;

	Game_Interpreter.prototype.pluginCommand = function(command, args) {

	};

	function Window_Scan() {
		this.initialize.apply(this, arguments);
	}

	Window_Scan.prototype = Object.create(Window_Selectable.prototype);
	Window_Scan.prototype.constructor = Window_Scan;

	Window_Scan.prototype.initialize = function(x,y) {
		// Set size of scan window.
		var width = Graphics.boxWidth;
		var height = this.fitting_height(3);


		Window_Selectable.prototype.initialize.call(this, x, y, width, height);

	};

	Window_Scan.prototype.display = function() {

	};

	Window_Scan.prototype.callUpdateHelp = function() {
		
	};

})();