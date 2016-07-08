package com.appodeal.supportanes;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import java.util.HashMap;
import java.util.Map;

public class AndroidSupportLibContext extends FREContext
{
    public void dispose() {}

    @SuppressWarnings({ "unchecked", "rawtypes" })
    public Map<String, FREFunction> getFunctions()
    {
        Map functions = new HashMap();
        return functions;
    }
}