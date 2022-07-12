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
- 단일 접근?(Single Approach)가 불충분할 경우 개선 메소드?(Enhancement Methods)의 조합을 사용하는 방법을 이해한다.

### 3.1 배경
#### 3.1.1 밝기 변환과 공간 필터링의 기초
__[단어 정리]__
Implement : 구현하다<br/>


__정리__
챕터 3에서 논의되는 모든 영상 처리 기법들은 단순히 영상의 화소들을 포함하는 평면인 공간 도메인에서 구현된다.<br/>
공간 도메인 기법은 영상의 화소에 직접 작용한다.<br/>
공간 도메인 기법들은 계산이 더 효율적이며, 구현에 더 적은 프로세싱 자원이 소요된다.<br/>
