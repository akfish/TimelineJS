# Global namespace
window.CATX ?= {}

CATX = window.CATX

__ = console.log.bind(console)

# Extension Manager
CATX.Extension = class ExtensionManager
        @Manager = new ExtensionManager

        hasThumbnail: (type) ->
                __ "Check thumbnail for #{type}"
                return type == "foo"

        getThumbnail: (asset) ->
                __ "Get thumbnail for:"
                __ asset
                "<div class='thumbnail thumb-plaintext' id='catx-extension-thumbnail'></div>"

        supportMediaType: (asset) ->
                __ "Check type for #{asset.media}"
                __ asset
                return true

        getMediaType: (asset) ->
                type:
                        "foo"
                id:
                        asset.media

        getMedia: (asset) ->
                "<div class='plain-text-quote'>" + "-_-" + "</div>";

        constructor: () ->
                

