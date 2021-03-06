# flutter_3d_choice_chip

This package provides a simple 3D choice chip.

<img src="https://raw.githubusercontent.com/matwright/flutter_3d_choice_chip/main/example/flutter_3d_choice_chip.webp" width="300">



## Getting Started

Import the file.

```
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
```

### Use with default style:

```
ChoiceChip3D(
  style: ChoiceChip3DStyle.blue, // ChoiceChip3DStyle.red, ChoiceChip3DStyle.white
  selected: true,
  onSelected: () {},
  onUnSelected: () {},
  child: Text("My Choice"),
);
```

### Use with custom style:

```
ChoiceChip3D(
  style: ChoiceChip3dStyle(
      topColor: Colors.lightGreen,
      backColor: Colors.deepOrange,
      borderRadius: BorderRadius.zero
  ),
  onSelected: () {},
  onUnSelected: () {},
  child: Text("My Choice"),
);
```

### Credit

Flutter 3D Choice Chip was inspired by [button3d](https://github.com/nguyenvanduocit/button3d)