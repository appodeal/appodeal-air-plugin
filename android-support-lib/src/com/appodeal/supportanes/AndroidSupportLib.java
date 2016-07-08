package com.appodeal.supportanes;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;
import com.appodeal.supportanes.AndroidSupportLibContext;

public class AndroidSupportLib
        implements FREExtension
{
    public FREContext createContext(String args)
    {
        return new AndroidSupportLibContext();
    }

    public void dispose() {}

    public void initialize() {}
}