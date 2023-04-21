module Rpx exposing (rpx, blc)

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

-}

import Css exposing (rem)
import Css.Value exposing (Value, Supported)




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
rpx : Float -> Value { provides | rem : Supported }
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
blc : Float -> Value { provides | rem : Supported }
blc num = rem <| num/2
