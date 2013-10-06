# Global namespace
window.CATX ?= {}

CATX = window.CATX

__ = console.log.bind(console)

# Extension Manager
CATX.Extension = class ExtensionManager
        @Manager = new ExtensionManager

        # Get html for rendering media thumbnail if it is supported by any extensions
        # @m
        # - type def from VMM.MediaType:
        # 		media	= {
	#			type:		"unknown", // The type of media.
        #			id:			"",
	#			start:		0,
	#			hd:			false,
	#			link:		"",
	#			lang:		VMM.Language.lang,
	#			uniqueid:	VMM.Util.unique_ID(6)
	#		};
        # @asset
        # - The url of media. Corresponds to asset session in JSON
        getThumbnail: (m, asset) ->
                __ "Get thumbnail for:"
                __ m
                __ asset
                "<div class='thumbnail thumb-plaintext' id='catx-extension-thumbnail'></div>"

        # Check if the type is supported by any extensions
        # @type
        # - The type of media. 
        supportMediaType: (type) ->
                __ "Check type for #{type}"
                return true

        # Get the media type if it is supported by any extensions
        # Otherwise the type field is 'unknown'
        # @media
        # - The url of media. Corresponds to asset.media in JSON        
        getMediaType: (media) ->
                type:
                        "foo"
                id:
                        media

        # Get html for rendering media if it is supported by any extensions
        # @m
        # - type def from VMM.MediaType:
        # 		media	= {
	#			type:		"unknown", // The type of media.
        #			id:			"",
	#			start:		0,
	#			hd:			false,
	#			link:		"",
	#			lang:		VMM.Language.lang,
	#			uniqueid:	VMM.Util.unique_ID(6)
	#		};
        # @asset
        # - The url of media. Corresponds to asset session in JSON
        getMedia: (m, asset) ->
                __ "Get media for: "
                __ m
                __ asset
                "<div class='plain-text-quote'>" + "-_-" + "</div>";

        register: (cls) ->
                

        constructor: () ->
                
# Base class for all Extensions
# They are all ```static``` classes
CATX.Extension.Base = class Extension
        # Type
        @type = "ext"
        @supportMedia: (media) -> return false
        @getMedia: (m, asset) ->
        @getThumbnail: (m, asset) ->
