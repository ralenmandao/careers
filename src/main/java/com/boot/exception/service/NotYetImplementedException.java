package com.boot.exception.service;

import com.boot.exception.BaseException;

public class NotYetImplementedException extends BaseException {
    private static final long serialVersionUID = -5223364559346480654L;

    public NotYetImplementedException(String serviceName) {
        super("Service not yet implemented: " + serviceName);
    }


    public NotYetImplementedException(String serviceName, Object errorCode) {
        super("Service not yet implemented: " + serviceName, errorCode);
    }
}
