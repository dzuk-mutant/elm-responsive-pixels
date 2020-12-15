module Rpx exposing (rpx, blc, add, subtract, negate)

{-| Provides easy shorthands for designing in rems in elm-css.

```
Html.label
    [ class "label"
    , for id
    , css   [ displayFlex
            , boxSizing borderBox
            , minHeight (blc 3) -- 1.5 rems, or 24px at 'normal' font size.
            , paddingTop (rpx 1) -- 0.0625 rems, or 1px at 'normal' font size.
            , fontSize (rpx 14) - 0.875 rems or 14px at 'normal' font size.
            ]
    ]
    []
```

# Units
All of these produce Css.Rem values for elm-css.

@docs rpx, blc


# Convenience math functions

Sometimes in a project you might want to establish consistent
metrics for certain things across your interface, but because of
how elm-css measurement values work, you can't use normal math operators
on Rem values. So these functions let you apply some basic math to Rems.

```
paddingLeft <| Rpx.subtract focusBorderWidth (blc 6)
```

@docs add, subtract, negate

-}

import Css exposing (Rem, rem)




{-| Responsive Pixels.

Write measurements in pixels that output to rems.

This gives you the easy to reason about unit of a pixel, but
allows you to publish in rems, which is a responsive
format that scales to user's browser font size preference.

- 1rpx = 1px at 16px (default) browser font size.
- 1rpx = 1/16rem

```
fontSize (rpx 14)
```
-}
rpx : Float -> Rem
rpx num = rem <| num/16


{-| Block.

A measurement that's 8rpx (0.5rem). This is a handy shorthand if you're
doing layout measurements in multiples of 8.

- 1blc = 8px at 16px (default) browser font size.
- 1blc = 1/2rem

```
padding (blc 2)
```
-}
blc : Float -> Rem
blc num = rem <| num/2




{-| Adds one Rem-based value (rem, rpx, blc) to another.

```
width <| Rpx.add thing (blc 10)
```
-}
add : Rem -> Rem -> Rem
add a b =
    rem (a.numericValue + b.numericValue)

{-| Subtracts one Rem-based value (rem, rpx, blc) from another.

```
paddingLeft <| Rpx.subtract focusBorderWidth (rpx 2)
```
-}
subtract : Rem -> Rem -> Rem
subtract a b =
    rem (a.numericValue - b.numericValue)

{-| Negates a Rem value (does the equivalent of Elm Core `Basics.negate`).

```
marginTop <| Rpx.negate importantMeasurement
```
-}
negate : Rem -> Rem
negate x =
    rem (Basics.negate x.numericValue)