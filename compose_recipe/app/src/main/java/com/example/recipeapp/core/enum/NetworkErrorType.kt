package com.example.recipeapp.core.enum

enum class NetworkErrorType {
    REQUEST_TIMEOUT, // 408
    UNAUTHORIZED, // 401
    NOT_FOUND, // 404
    SERVER_ERROR, // 500~600
    UN_KNOWN,
    JSON_PARSING_ERROR
}

fun Int.statusCodeToNetWorkErrorType(): NetworkErrorType? {
    return if (this in (200 until 300)) {
        null
    } else if (this in (400 until 500)) {
        when (this) {
            401 -> NetworkErrorType.UNAUTHORIZED
            404 -> NetworkErrorType.NOT_FOUND
            408 -> NetworkErrorType.REQUEST_TIMEOUT
            else -> NetworkErrorType.UN_KNOWN
        }
    } else if (this in (500 until 600)) {
        NetworkErrorType.SERVER_ERROR
    } else {
        NetworkErrorType.UN_KNOWN
    }
}