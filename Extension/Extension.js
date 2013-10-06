// Generated by CoffeeScript 1.6.3
(function() {
  var CATX, ExtensionManager, __;

  if (window.CATX == null) {
    window.CATX = {};
  }

  CATX = window.CATX;

  __ = console.log.bind(console);

  CATX.Extension = ExtensionManager = (function() {
    ExtensionManager.Manager = new ExtensionManager;

    ExtensionManager.prototype.getThumbnail = function(m, asset) {
      __("Get thumbnail for:");
      __(m);
      __(asset);
      return "<div class='thumbnail thumb-plaintext' id='catx-extension-thumbnail'></div>";
    };

    ExtensionManager.prototype.supportMedia = function(media) {
      __("Check meida for " + media);
      return true;
    };

    ExtensionManager.prototype.supportMediaType = function(type) {
      __("Check type for " + type);
      return true;
    };

    ExtensionManager.prototype.getMediaType = function(media) {
      return {
        type: "foo",
        id: media
      };
    };

    ExtensionManager.prototype.getMedia = function(m, asset) {
      __("Get media for: ");
      __(m);
      __(asset);
      return "<div class='plain-text-quote'>" + "-_-" + "</div>";
    };

    function ExtensionManager() {}

    return ExtensionManager;

  })();

}).call(this);

/*
//@ sourceMappingURL=Extension.map
*/
