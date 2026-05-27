# Task 4 — Goal-Driven Execution

## 원칙
검증 가능한 성공 기준 정의 / 테스트 기반 루프

## 프롬프트 (그대로 입력)
> 이 함수에 버그가 있어. 입력 `[1, -2, 3]`일 때 결과가 이상해. 고쳐줘.

## 초기 코드

```python
def sum_positive(nums):
    total = 0
    for n in nums:
        total += n  # bug: should be `if n > 0`
    return total
```

## 예상 A 함정
재현 테스트 없이 코드만 수정. 수정 후 동작 확인 단계 생략.

## B 합격 기준
- 재현 테스트 작성 → 실패 확인 → 수정 → 통과 확인 (4단계 모두 수행)
- 테스트 코드가 실제로 파일에 저장됨
