# VCMaterialDesignIcons
material design icon fonts are from http://zavoloklom.github.io/material-design-iconic-font/icons.html

    // create icon with MaterialDesignCode code and font size
    // font size is the basis for icon size
    VCMaterialDesignIcons *icon = [VCMaterialDesignIcons iconWithCode:VCMaterialDesignIconCode.md_bug_report fontSize:30.f];
    
    // add attribute to icon
    [icon addAttribute:NSForegroundColorAttributeName value:[self getRandomColor]];
    
    // the icon will be drawn to UIImage in a given size
    UIImage *image = [icon imageWithSize:CGSizeMake(30.f, 30.f)];
