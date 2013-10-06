# Global namespace
window.CATX ?= {}

CATX = window.CATX

__ = console.log.bind(console)
T_T = console.error.bind(console)

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
                if @supportMediaType(m.type)
                        return @extensions[m.type].getThumbnail m, asset

        # Check if the type is supported by any extensions
        # @type
        # - The type of media. 
        supportMediaType: (type) ->
                __ "Check type for extension #{type}"
                return @extensions[type]?

        # Get the media type if it is supported by any extensions
        # Otherwise the type field is 'unknown'
        # @media
        # - The url of media. Corresponds to asset.media in JSON        
        getMediaType: (media) ->
                for type, ext of @extensions
                        if ext.supportMedia media
                                return ext.getMediaType()
                return type:
                                "unknown"
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
                if @supportMediaType(m.type)
                        return @extensions[m.type].getMedia m, asset

        register: (ext) ->
                type = ext.type
                if not type?
                        T_T "Try to register an extension without type:"
                        T_T ext
                        return
                if type in @extensions
                        T_T "Extension type #{type} already registered"
                        return
                @extensions[type] = ext
                __ "Extension type #{type} registered:"
                __ ext

        constructor: () ->
                @extensions = {}
                
# Base class for all Extensions
# They are all ```static``` classes
CATX.Extension.Manager.register CATX.Extension.Base = class Extension
        # Type
        @type = "foo"
        @getMediaType: (media) -> {type: "foo", id: media}
        @supportMedia: (media) -> return true
        @getMedia: (m, asset) -> "<div class='plain-text-quote'>" + "-_-" + "</div>";
        @getThumbnail: (m, asset) -> "<div class='thumbnail thumb-plaintext' id='catx-extension-thumbnail'></div>"
