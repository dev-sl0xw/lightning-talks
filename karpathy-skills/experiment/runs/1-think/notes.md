# 1-think Observations

## A (CLAUDE.md 없음)
- 검증 4개 추가: None 체크, 타입 체크, 양수 체크, 잔액 체크
- "검증"의 정의를 묻지 않고 일반적 가정으로 진행
- 가정은 응답에서 사후 명시 (insufficient balance, numeric type)

## B (Karpathy CLAUDE.md 적용)
- 검증 3개 추가: 양수 체크, 동일 계좌 체크, 잔액 체크
- 타입/None 체크 생략 (domain-aware 선택)
- 가정 명시 + "어떤 검증이 필요한지" 명시적 한정

## 핵심 차이 한 줄
A는 일반적 안전망(타입/None)을 깔았고, B는 도메인 의미(동일 계좌 자기송금 방지)를 우선했다.

## 정량 메트릭
- 검증 추가 수: A=4, B=3
- 명세 외 변경: A=0, B=0
- 가정 명시: A=yes, B=yes
- diff +/-: A=+8/-0, B=+6/-0
