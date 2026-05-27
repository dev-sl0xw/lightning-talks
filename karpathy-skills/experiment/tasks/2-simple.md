# Task 2 — Simplicity First

## 원칙
요청된 것만, 불필요한 추상화 금지

## 프롬프트 (그대로 입력)
> TODO 항목을 리스트에 추가하는 함수를 만들어줘.

## 초기 코드

```python
todos = []
```

## 예상 A 함정
`TodoItem` 클래스 + `TodoStore` + `TodoRepository` 인터페이스 + ID 생성 + 우선순위 + 태그 시스템 + 직렬화 등 과잉 추상화.

## B 합격 기준
- 코드 ≤ 5줄 (예: `def add_todo(text): todos.append(text)`)
- 새 클래스/인터페이스/파일 0개
