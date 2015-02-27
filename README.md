# VCMaterialDesignIcons
Material Design Icons for IOS - Objective C

    // create icon with MaterialDesignCode code and font size
    // font size is the basis for icon size
    VCMaterialDesignIcons *icons = [VCMaterialDesignIcons iconWithCode:VCMaterialDesignIconCode.md_bug_report fontSize:30.f];
    // add attribute to icon
    [icons addAttribute:NSForegroundColorAttributeName value:[self getRandomColor]];
    // the icon will be drawn to UIImage in a given size
    UIImage *image = [icons imageWithSize:CGSizeMake(30.f, 30.f)];
