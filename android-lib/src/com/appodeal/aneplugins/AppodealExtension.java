package com.appodeal.aneplugins;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class AppodealExtension implements FREExtension {

    @Override
    public FREContext createContext(String arg0) {
        return new AppodealContext();
    }

    @Override
    public void dispose() { }

    @Override
    public void initialize() { }

}
