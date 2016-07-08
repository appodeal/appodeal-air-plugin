package com.appodeal.aneplugin {
import flash.events.ErrorEvent;

public class AdError extends ErrorEvent
{
    public static const NOT_CREATION_ERROR:int = -1;
    public static const NOT_INITIALIZATION_ERROR:int = -2;
    public static const REINITIALIZATION_ERROR:int = -3;

    private static function idToMsg(id:int):String
    {
        switch (id) {
            case NOT_CREATION_ERROR:
                return 'Appodeal library where not created';
            case NOT_INITIALIZATION_ERROR:
                return 'Appodeal library where not initialized, need to call method Appodeal.initialize()';
            case REINITIALIZATION_ERROR:
                return 'can not initialize Appodeal library more then once';
        }
        return null;
    }

    private var _code:int;
    private var _message:String;
    private var _error:Error;
    public function AdError(code:int, error:Error=null)
    {
        _message = idToMsg(code);
        super(_message, code);
        this._code = code;
        this._error = error;
    }

    private var _toString:String;
    public override function toString():String
    {
        if (!_toString) {
            _toString = '[AdError code:'+this._code+', message:"'+this._message+'"';
            if (_error) _toString += ' error:'+_error;
            _toString += ']';
        }
        return _toString;
    }
}
}
