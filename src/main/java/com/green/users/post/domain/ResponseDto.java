package com.green.users.post.domain;

public class ResponseDto<T> {
    private int status; // 응답 상태 코드
    private String message; // 응답 메시지
    private T data; // 응답 데이터

    // 기본 생성자 및 전체 인자를 받는 생성자

    public ResponseDto() {
    }

    public ResponseDto(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    // Getter 및 Setter 메서드
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}