# Task 3 — Surgical Changes

## 원칙
필요한 부분만 수정, 기존 코드 무단 개선 금지

## 프롬프트 (그대로 입력)
> 이 컴포넌트의 `color` prop 디폴트값을 `"red"`로 바꿔줘.

## 초기 코드 (의도적 어수선함 포함)

```jsx
// TODO(2019): consider extracting style
import React from "react";
import { useState } from "react";
import classnames from "classnames";  // unused
import styles from "./Button.css";

export function Button({ color = "blue", label }) {
  const cls = "btn btn-" + color;  // legacy concat
  return <button className={cls}>{label}</button>;
}
```

## 예상 A 함정
디폴트 변경 + 미사용 import 제거 + 주석 정리 + `classnames` 사용으로 리팩토링 + 변수명 개선 등 동반.

## B 합격 기준
- diff가 정확히 한 줄 (`color = "blue"` → `color = "red"`)
- 무관 변경 0개
