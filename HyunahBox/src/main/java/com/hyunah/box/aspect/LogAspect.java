package com.hyunah.box.aspect;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class LogAspect {
	private Logger logger = LoggerFactory.getLogger(LogAspect.class);

	
    @After("execution(* com.hyunah.box..*(..))")
    public void logMethodCall(JoinPoint joinPoint) {
    	LocalDateTime now = LocalDateTime.now(); // 현재 날짜와 시간을 가져옵니다.
        // 원하는 포맷을 정의합니다.
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("[yyyy-MM-dd HH:mm:ss]");
        // 날짜와 시간을 포맷에 맞게 문자열로 변환합니다.
        String formattedDateTime = now.format(formatter);
        
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getName();
        logger.info("'{}'----- Method '{}' was called. -----", formattedDateTime, methodName);
        
        
    }
}
