/*
 * @plugindesc Custom Tutorial Plugin for RPG Maker MV,
 * following SumRndmDude's tutorials.
 *
 * @author boaromayo
 *
 * @param x
 * @desc Title x-coordinate.
 * @default 20
 *
 * @param y
 * @desc Title y-coordinate.
 * @default Graphics.height / 4
 *
 * @param OutlineColor
 * @desc Title y-coordinate.
 * @default white
 *
 * @param width
 * @desc Title y-coordinate.
 * @default 20
 *
 * @help
 *
 *
 */

(function() {

  var params = PluginManager.parameters('tut-plugin');
  var paramX = params['x'];
  var paramY = params['y'];
  var paramOutlineColor = params['OutlineColor'];
  var paramWidth = params['width'];

  Scene_Title.prototype.drawGameTitle = function() {
    var x = paramX;
    var y = paramY;
    var maxWidth = Graphics.width - x * 2;
    var text = $dataSystem.gameTitle;
    var titleSprite = this._gameTitleSprite.bitmap;

    titleSprite.outlineColor = paramOutlineColor;
    titleSprite.outlineWidth = paramWidth;
    titleSprite.fontSize = 99;
    titleSprite.drawText(text, x, y, maxWidth, 48, 'center');
  };

})();
