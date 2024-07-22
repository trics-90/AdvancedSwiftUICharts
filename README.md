# AdvancedCharts

A description of this package.

## Bar Chart
### How to use
Чтобы использовать BarChart, нужно добавить в свой View экземпляр `BarChartView()`.  При инициализации `BarChartView()` нужно определить два параметра: data типа [BarItem] и settings типа BarChartSettings(). В этом графике для данных отведен свой тип `BarItem`. Он описан ниже.

### Data
Для данных в этом графике отведен отведен свой тип, в который необходимо преобразовать ваши данные. Это тип `BarItem`. У этого типа есть два параметра: value: Double и description: String. В value передается значение, от которого зависит высота столбца, а в description описание (например, дата).  description и value будут отображаться вместо заголовка графика при нажатии на график.
### Settings
#### Title & Subtitle Settings
В начале определите заголовок, подзаголовок и их цвет. Создайте экземпляр структуры `BarChartTitleSettings()`. При его инициализации определите следующие параметры:
1. title – название вашего графика типа `String`
2. subTitle – подзаголовок вашего графика (Не обязательно) типа `String`
3. titleColor – Цвет заголовка (Не обязательно) типа `Color`
4. subTitleColor – Цвет подзаголовка (Не обязательно) типа `Color`

#### Bar Settings
Для определения внешнего вида столбцов графика вам нужно создать экземпляр структуры `BarSettings()`. Его задавать не обязательно. При его инициализации определите следующие параметры:
1. barWidthMultiplier – модификатор ширины столбца типа `CGFloat`
2. maxBarColor – цвет столбца с максимальным значением типа `Color`
3. minBarColor – цвет столбца с минимальным значением типа `Color`
4. mediumBarColor – цвет остальных столбцов, которые не являются ни наибольшими ни наименьшими типа `Color`
5. maxBarBlur – значение размытия фона под максимальным столбцом типа `CGFloat`
6. minBarBlur – значение размытия фона под минимальным столбцом типа `CGFloat`
7. mediumBarBlur – размер размытия фона под остальными столбцами типа `CGFloat`
8. cornerRadiusMultiplier – Процент закругления столбцов (от 0 до 1) типа `Double`
#### Summary
Для задания настроек всему графику необходимо создать экземпляр структуры `BarChartSettings()` и передать ему созданный ранее `BarChartTitleSettings()` с определенным параметром `title` (обязательно) или, при необходимости, передать остальные параметры, включая созданный экземпляр `BarSettings()`.


## Speedometer Chart
### How to use
Чтобы использовать SpeedometerChart, нужно добавить в свой View экземпляр `SpeedometerChart()`.  При инициализации `BarChartView()` нужно определить три параметра: data типа `Double`, targets типа `[Double]` и settings типа BarChartSettings(). Data принимает значение от 0 до 1 и интерпретируется в проценты. Targets принимает любые значения и определяет размерность графика.
### Settings
#### Title & Subtitle Settings
В начале определите заголовок, подзаголовок и их цвет. Создайте экземпляр структуры `SpeedTitleSettings()`. При его инициализации определите следующие параметры:
1. title – название вашего графика типа `String`
2. subTitle – подзаголовок вашего графика (Не обязательно) типа `String`
3. titleColor – Цвет заголовка (Не обязательно) типа `Color`
4. subTitleColor – Цвет подзаголовка (Не обязательно) типа `Color`
#### Outer Circle Settings
Для определения внешнего вида внешней шкалы можно создать экземпляр `SpeedOuterCircleSettings()` и определить 3 параметра:
1. lineWidth – ширина внешнего круга (границы) типа `CGFloat`
2. gradienMinColor – начальный цвет при минимальном значении типа `Color`
3. gradientMaxColor – конечный цвет при максимальном значении типа `Color`
Если потребовалось изменить внешний вид внешнего кольца, нужно его присвоить созданному экземпляру `SpeedChartSettings()` в параметр `outerCircleSettings`
#### Inner Circle Settings
Для определения внешнего вида внешней шкалы можно создать экземпляр `SpeedInnerCircleSettings()` и определить 3 параметра:
1. lineWidth – ширина внутреннего круга (границы) типа `CGFloat`
2. gradienMinColor – начальный цвет при минимальном значении типа `Color`
3. gradientMaxColor – конечный цвет при максимальном значении типа `Color`
Если потребовалось изменить внешний вид внутреннего кольца, нужно его присвоить созданному экземпляру `SpeedChartSettings()` в параметр `innerCircleSettings`
#### Indicator Settings
Чтобы изменить внешний вид индикатора (стрелки) графика, нужно создать экземпляр `SpeedIndicatorSettings()` и определить нужные параметры. Всего есть 6 параметров:
1. circleRadius – радиус основания индикатора (круга) типа `CGFloat`
2. circleColor – цвет основания индикатора (круга) типа `Color`
3. stickWidth – Ширина стрелки типа `CGFloat`
4. stickColor – цвет стрелки типа `Color`
5. stickCornerRadius – радиус закругления стрелки типа `CGFloat`
6. stickShadowRadius – радиус тени стрелки типа `CGFloat`
Если потребовалось изменить внешний вид внутреннего кольца, нужно его присвоить созданному экземпляру `SpeedChartSettings()` в параметр `speedIndicatorSettings`
#### Targets Settings
Чтобы изменить внешний вид показателей графика, нужно создать экземпляр `TargetsSettings()` и определить нужные параметры. Всего есть 3 параметра:
1. minTargetColor – цвет минимального значения типа `Color`
2. maxTargetColor – цвет максимального значения типа `Color`
3. mediumTargetColor – цвет средних значений типа `Color`
Если потребовалось изменить внешний вид индикатора, нужно его присвоить созданному экземпляру `SpeedChartSettings()` в параметр `targetsSettings`
#### Summary
Для задания настроек всему графику необходимо создать экземпляр структуры `SpeedChartSettings()` и передать ему созданный ранее `SpeedTitleSettings()` с определенным параметром `title` (обязательно) или, при необходимости, передать остальные параметры, включая созданные экземпляры `SpeedInnerCircleSettings()`, `SpeedInnerCircleSettings()`, `SpeedIndicatorSettings()`, `TargetsSettings()`

# AdvancedCharts

A description of this package.
## Bar Chart
### How to use

To use the BarChart, you need to add an instance of `BarChartView()` to your View. When initializing `BarChartView()`, you need to define two parameters: data of type `[BarItem]` and settings of type `BarChartSettings()`. This chart uses a specific type for the data called BarItem. It is described below.
### Data

For this chart, there is a specific type for the data that you need to convert your data into. This type is BarItem. It has two parameters: `value`: `Double` and `description`: `String`. The value parameter takes the value that determines the height of the bar, while the description parameter provides a description (e.g., a date). The description and value will be displayed instead of the chart title when you click on the chart.
### Settings
#### Title & Subtitle Settings

First, define the `title`, `subtitle`, and their colors. Create an instance of the `BarChartTitleSettings()` structure. When initializing it, define the following parameters:

1. `title` – the name of your chart of type `String`
2. `subTitle` – the subtitle of your chart (optional) of type `String`
3. `titleColor` – the color of the title (optional) of type `Color`
4. `subTitleColor` – the color of the subtitle (optional) of type `Color`

#### Bar Settings

To define the appearance of the bars in the chart, you need to create an instance of the `BarSettings()` structure. It is not mandatory to set it. When initializing it, define the following parameters:

1. `barWidthMultiplier` – bar width modifier of type `CGFloat`
2. `maxBarColor` – color of the bar with the maximum value of type `Color`
3. `minBarColor` – color of the bar with the minimum value of type `Color`
4. `mediumBarColor` – color of the other bars that are neither the highest nor the lowest of type `Color`
5. `maxBarBlur` – background blur value under the maximum bar of type `CGFloat`
6. `minBarBlur` – background blur value under the minimum bar of type `CGFloat`
7. `mediumBarBlur` – background blur value under the other bars of type `CGFloat`
8. `cornerRadiusMultiplier` – bar corner rounding percentage (from 0 to 1) of type `Double`

#### Summary

To set the settings for the entire chart, you need to create an instance of the `BarChartSettings()` structure and pass the previously created `BarChartTitleSettings()` with the defined title parameter (mandatory) or, if necessary, pass other parameters, including the created instance of `BarSettings()`.
## Speedometer Chart
### How to use

To use the SpeedometerChart, you need to add an instance of `SpeedometerChart()` to your View. When initializing `SpeedometerChart()`, you need to define three parameters: `data` of type `Double`, `targets` of type `[Double]`, and `settings` of type `SpeedChartSettings()`. The data parameter takes a value from 0 to 1 and is interpreted as a percentage. The targets parameter takes any values and determines the chart's scale.
### Settings
#### Title & Subtitle Settings

First, define the `title`, `subtitle`, and their colors. Create an instance of the `SpeedTitleSettings()` structure. When initializing it, define the following parameters:

1. `title` – the name of your chart of type `String`
2. `subTitle` – the subtitle of your chart (optional) of type `String`
3. `titleColor` – the color of the title (optional) of type `Color`
4. `subTitleColor` – the color of the subtitle (optional) of type `Color`

#### Outer Circle Settings

To define the appearance of the outer scale, you can create an instance of `SpeedOuterCircleSettings()` and define 3 parameters:

1. `lineWidth` – the width of the outer circle (border) of type `CGFloat`
2. `gradientMinColor` – the starting color at the minimum value of type `Color`
3. `gradientMaxColor` – the ending color at the maximum value of type `Color`
    If you need to change the appearance of the outer ring, you need to assign it to the created instance of `SpeedChartSettings()` in the `outerCircleSettings` parameter.

#### Inner Circle Settings

To define the appearance of the inner scale, you can create an instance of `SpeedInnerCircleSettings()` and define 3 parameters:

1. `lineWidth` – the width of the inner circle (border) of type `CGFloat`
2. `gradientMinColor` – the starting color at the minimum value of type `Color`
3. `gradientMaxColor` – the ending color at the maximum value of type `Color`
    If you need to change the appearance of the inner ring, you need to assign it to the created instance of `SpeedChartSettings()` in the `innerCircleSettings` parameter.

#### Indicator Settings

To change the appearance of the indicator (pointer) of the chart, you need to create an instance of `SpeedIndicatorSettings()` and define the necessary parameters. There are a total of 6 parameters:

1. `circleRadius` – the radius of the indicator base (circle) of type `CGFloat`
2. `circleColor` – the color of the indicator base (circle) of type `Color`
3. `stickWidth` – the width of the pointer of type `CGFloat`
4. `stickColor` – the color of the pointer of type `Color`
5. `stickCornerRadius` – the corner radius of the pointer of type `CGFloat`
6. `stickShadowRadius` – the shadow radius of the pointer of type `CGFloat`
    If you need to change the appearance of the inner ring, you need to assign it to the created instance of `SpeedChartSettings()` in the `speedIndicatorSettings` parameter.

#### Targets Settings

To change the appearance of the chart indicators, you need to create an instance of `TargetsSettings()` and define the necessary parameters. There are a total of 3 parameters:

1. `minTargetColor` – the color of the minimum value of type `Color`
2. `maxTargetColor` – the color of the maximum value of type `Color`
3. `mediumTargetColor` – the color of the medium values of type `Color`
    If you need to change the appearance of the indicator, you need to assign it to the created instance of `SpeedChartSettings()` in the `targetsSettings` parameter.

#### Summary

To set the settings for the entire chart, you need to create an instance of the `SpeedChartSettings()` structure and pass the previously created `SpeedTitleSettings()` with the defined `title` parameter (mandatory) or, if necessary, pass other parameters, including the created instances of `SpeedInnerCircleSettings()`, `SpeedOuterCircleSettings()`, `SpeedIndicatorSettings()`, `TargetsSettings()`.
