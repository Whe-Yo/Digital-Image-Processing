# Digital-Image-Processing-4th
2022 하계 세미나 디지털 영상 처리

## Chapter 3
### 프리뷰
__[단어 정리]__<br/>
Spatial Domain : 공간 도메인<br/>
image plane : 영상 평면<br/>
transform domain : 변환 도메인 (챕터4, 6)<br/>
inverse transform : 역변환<br/>
intensity transformation : 밝기 변환<br/>
spatial filtering : 공간 필터링<br/>
contrast manipulation : 콘트라스트(대비?) 조작<br/>
image tresholding : 영상 문턱치 처리<br/>
smoothing : 스무딩<br/>
sharpening : 샤프닝<br/><br/>


__기억해야 하는 것__
- 공간 도메인 처리(Processing)와 변환 도메인 처리의 차이를 이해한다.
- 밝기 변환에 사용되는 주요 기술들에 익숙해진다.
- 영상 히스토그램의 물질적인? 의미와 그것이 어떻게 영상 향상을 위해 조작될 수 있는지 이해한다.
- 공간 필터링의 기술들과 공간 필터링이 어떻게 형성되는지 이해한다.
- 공간의 회선?(Convolution)과 상관관계 원칙을 이해한다.
- 공간 필터의 주요 타입을 알고 그것들이 어떻게 쓰이는지 이해한다.
- 공간 필터와 저역 통과 필터?(Low pass filter)의 근본적인 역할의 관계를 안다.
- 단일 접근?(Single Approach)가 불충분할 경우 개선 메소드?(Enhancement Methods)의 조합을 사용하는 방법을 이해한다.<br/><br/>


### 3.1 배경
#### 3.1.1 밝기 변환과 공간 필터링의 기초<br/>
__[단어 정리]__
implement : 구현하다<br/>
elementwise : 요소별<br/>
implementation : 구현<br/>
operator : 연산자<br/>
rectangular : 사각형<br/><br/>


__정리__<br/>
챕터 3에서 논의되는 모든 영상 처리 기법들은 단순히 영상의 화소들을 포함하는 평면인 공간 도메인에서 구현된다.<br/>
공간 도메인 기법은 영상의 화소에 직접 작용한다.<br/>
공간 도메인 기법들은 계산이 더 효율적이며, 구현에 더 적은 프로세싱 자원이 소요된다.<br/><br/>

이웃의 최소 크기는 1 x 1이다.<br/>
연산 순서는 입력 영상의 왼쪽 위에서부터 수평 방향으로 한 화소씩, 한번에 한 행씩 진행한다.<br/>
이웃의 원점이 영상의 경계에 있을 경우, 이웃의 일부가 바깥에 존재하게 되는데 이는 무시하거나, 0 또는 지정된 밝기 값들의 경계로 영상을 패딩하여 계산한다.<br/><br/>

이웃의 크기가 1 x 1일 경우 g(x, y) = T[f(x, y)] 식은 s = T(r) 식이 된다. s와 r은 각각 g(x, y)와 f(x, y)의 밝기 변수이다.<br/><br/>

콘트라스트 스트레칭 : k보다 낮은 r값(밝기 변수)은 변환 함수에 의해 흑색 쪽으로, 높은 r값은 백색 쪽으로 s의 좁은 범위에 압축된다.<br/>
문턱치 처리 : 콘트라스트 스트레칭과 유사하지만 더욱 극단적이다.<br/>
