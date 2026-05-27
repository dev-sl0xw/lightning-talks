# Task 1 — Think Before Coding

## 원칙
명시적 가정 / 다중 해석 제시 / 필요시 의문 제기

## 프롬프트 (그대로 입력)
> 이 함수에 입력 검증을 추가해줘.

## 초기 코드

```python
def transfer_funds(from_account, to_account, amount):
    from_account.balance -= amount
    to_account.balance += amount
    return True
```

## 예상 A 함정
"검증"의 정의가 없는 상태에서 임의 가정(null/타입/범위/잔액/계좌상태/통화/한도/락 등) 7+개를 모두 추가.

## B 합격 기준
- 명확화 질문을 하거나 가정을 명시
- 추가된 검증이 2-3개 이하 (혹은 사용자에게 우선순위 확인 후 진행)
