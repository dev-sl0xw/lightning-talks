# Company Lightning Talk

Lightning Talk 발표 자료 — 하네스 엔지니어링, 한국어 마스터 → 일본어 발표용 번역.

## 사전 준비

```bash
npm install
```

Node.js / npm이 설치되어 있어야 합니다. Marp CLI는 `devDependencies`로 로컬 설치됩니다 (전역 설치 불필요).

## 빌드

```bash
# 한국어 (마스터)
npm run build:ko:html   # build/slides.ko.html
npm run build:ko:pdf    # build/slides.ko.pdf

# 일본어 (발표용)
npm run build:ja:html   # build/slides.ja.html
npm run build:ja:pdf    # build/slides.ja.pdf
```

## 프리뷰

```bash
npm run preview:ko   # 한국어 슬라이드 실시간 프리뷰
npm run preview:ja   # 일본어 슬라이드 실시간 프리뷰
```

`--watch` 옵션이 켜져 있어 마크다운을 수정하면 자동으로 다시 렌더링됩니다.

## 번역 워크플로우

1. `slides.ko.md`에서 한국어 마스터 슬라이드를 완성합니다.
2. `cp slides.ko.md slides.ja.md`로 복사합니다.
3. `glossary.md`의 용어 사전을 기준으로 `slides.ja.md`를 일본어로 번역합니다 (「です・ます」체 + 불릿 압축).

## 디렉토리 구조

```
assets/   이미지, 폰트 등 슬라이드용 정적 자산
demo/     데모 캡처, 코드 스니펫 등
themes/   Marp 커스텀 테마 (.css)
build/    빌드 산출물 (HTML/PDF) — gitignore
```
