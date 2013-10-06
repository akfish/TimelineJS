// Generated by CoffeeScript 1.6.3
(function() {
  var CATX, Extension, ExtensionManager, T_T, __,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  if (window.CATX == null) {
    window.CATX = {};
  }

  CATX = window.CATX;

  __ = console.log.bind(console);

  T_T = console.error.bind(console);

  CATX.Extension = ExtensionManager = (function() {
    ExtensionManager.Manager = new ExtensionManager;

    ExtensionManager.prototype.getThumbnail = function(m, asset) {
      __("Get thumbnail for:");
      __(m);
      __(asset);
      if (this.supportMediaType(m.type)) {
        return this.extensions[m.type].getThumbnail(m, asset);
      }
    };

    ExtensionManager.prototype.supportMediaType = function(type) {
      __("Check type for extension " + type);
      return this.extensions[type] != null;
    };

    ExtensionManager.prototype.getMediaType = function(media) {
      var ext, type, _ref;
      _ref = this.extensions;
      for (type in _ref) {
        ext = _ref[type];
        if (ext.supportMedia(media)) {
          return ext.getMediaType(media);
        }
      }
      return {
        type: "unknown"
      };
      return {
        id: media
      };
    };

    ExtensionManager.prototype.getMedia = function(m, asset) {
      __("Get media for: ");
      __(m);
      __(asset);
      if (this.supportMediaType(m.type)) {
        return this.extensions[m.type].getMedia(m, asset);
      }
    };

    ExtensionManager.prototype.register = function(ext) {
      var type;
      type = ext.type;
      if (type == null) {
        T_T("Try to register an extension without type:");
        T_T(ext);
        return;
      }
      if (__indexOf.call(this.extensions, type) >= 0) {
        T_T("Extension type " + type + " already registered");
        return;
      }
      this.extensions[type] = ext;
      __("Extension type " + type + " registered:");
      return __(ext);
    };

    function ExtensionManager() {
      this.extensions = {};
    }

    return ExtensionManager;

  })();

  CATX.Extension.Base = Extension = (function() {
    function Extension() {}

    Extension.type = "foo";

    Extension.getMediaType = function(media) {
      return {
        type: "foo",
        id: media
      };
    };

    Extension.supportMedia = function(media) {
      return true;
    };

    Extension.getMedia = function(m, asset) {
      return "<div class='plain-text-quote'>" + "-_-" + "</div>";
    };

    Extension.getThumbnail = function(m, asset) {
      return "<div class='thumbnail thumb-plaintext' id='catx-extension-thumbnail'></div>";
    };

    return Extension;

  })();

}).call(this);

/*
//@ sourceMappingURL=Extension.map
*/
