<a name="tMJSz"></a>
# ![china-2.png](https://cdn.nlark.com/yuque/0/2023/png/213807/1682377811568-62430f6e-2085-4044-b2c0-f372851ef03c.png#averageHue=%23eac4c2&clientId=u7a05b3c8-bd4d-4&from=paste&height=50&id=u3b8a15b3&originHeight=100&originWidth=100&originalType=binary&ratio=2&rotation=0&showTitle=false&size=10497&status=done&style=none&taskId=u04a94635-1d8b-40b7-98eb-efe61c6e631&title=&width=50)
<a name="beqYw"></a>
### English | [中文](/README_ZH.md)
<a name="wNymF"></a>
# Preface
By chance, I ran into the iOS [vest bag business](https://www.yuque.com/docs/share/7e70244c-5dea-4035-b634-65cc082097da?translate=en) . I also used other tools on the market in the early stage, but the actual effect was not ideal. After a lot of practice, a full-featured [obfuscation tool has been developed](https://github.com/520coding/confuse) . The tool have been packaged into a Mac application which support multiple programming languages, such as OC, C++, Swift. More functions are still being packaged, so stay tuned.
<a name="ixxhF"></a>
# Prompt
In order to let everyone get started quickly and compare the effects of confusion, a new test project [**confuse_test**](https://github.com/520coding/confuse/tree/master/confuse_test) was created. If you encounter problems during actual use, welcome to extend the test project. Please indicate the bug details in the project, and there will be rewards.
<a name="sbrhD"></a>
### Test engineering description:
> [confuse_test](https://github.com/520coding/confuse/tree/master/confuse_test): Contains oc, c++, swift and some third-party use cases to quickly verify the overall effect  
> [confuse_test_oc](https://github.com/520coding/confuse/tree/master/confuse_test_oc): only contains oc, which is convenient to verify the effect of each function  
> [confuse_test_oc_fast](https://github.com/520coding/confuse/tree/master/confuse_test_oc_fast): only contains oc, which is convenient to quickly verify the effect of some functions  
> [confuse_test_swift](https://github.com/520coding/confuse/tree/master/confuse_test_swift): only contains swift, the code comes from[ Apple's official example code](https://docs.swift.org/swift-book/index.html#//apple_ref/doc/uid/TP40014097-CH3-ID0), which is convenient to verify the effect of each function  

The source code can be modified arbitrarily to verify the actual effect. It is recommended to use different tools to confuse the above test projects or third-party open source library projects to compare the effects.
> Instructions for the old version before 1.2.0:  
> Introduction: No grammar and compilation requirements are involved, but partial omissions or corrections may occur after confusion, please add to the blacklist filter by yourself.  
> Applicable projects: RN and other mixed projects that have not yet been adapted.  
> Conditions of use: temporarily unavailable, reopen later

<a name="Yng3v"></a>
# Readme
<a name="6e674183b5d2f1af15baaa27bb7c93b2"></a>
### The essence of vest bag:

1. The first stage reduces the repetition rate. The initial version of my development is basically similar to other tools currently on the market, mainly the basic function of global substitution of class name, method name, and variable name.
2. The second stage reduces the similarity (normal distribution of the same elements). At present, the tool has been greatly improved after optimization and continuous reconstruction, and it basically meets the requirements in this respect. For details, see the following function introduction. There are two sides to everything. The more powerful the function, the longer it will take to confuse. If your project is large, it is possible to confuse for a few hours. Please do not take offense, and continue to optimize.
<a name="fc8a03eacc987f4c5e94e6dc0086ea50"></a>
### Distinguish the pros and cons of tools
In fact, to identify the pros and cons of a tool, just look at the following points:

1. Can modify all attributes, methods, and all parameter names of methods
2. Modify the name of the member (attribute, method), can it be distinguished by class, or a simple global replacement
3. Can modify the method with block parameters, a typical network request
> For example：+ (BOOL)post:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpRequestResponse)success error:(HttpRequestResponse)error;

3. The length of the changed name of the method name and attribute name (this tool can guarantee that 60~80% of the changed name is a common word, such as name, title, etc., and ensure that it does not conflict with the system.~~Completely abandon the simple practice of relying on a large number of word libraries to ensure the uniqueness of naming~~, The real simulation of manual development)
4. Modify the layout (Frame, Masonry, SDAutoLayout)
5. Is the code inserted or "garbage" (this tool creates custom controls, encapsulates network requests, and uses MVC pattern association between files to completely bid farewell to "garbage" and mix the spurious with the genuine).
6. Not to mention "Who else..." can identify macros, distinguish contextual content such as inheritance chains, and intelligently identify unmodifiable parts
> For example: + (void)init ;-(void)reloadData; basically can be changed, who else can do it? "

7. Normal projects (or third-party libraries) basically do not report errors after obfuscation (except for some individual [improper grammars](https://www.yuque.com/docs/share/4a87ec96-80fe-4d25-873d-93cb428b3e15#iz0Zi) that cause confusion and report errors)
<a name="426215c094f184f34acdb12593ddb1fc"></a>
# Features
confuse is a [confusion tool](https://github.com/520coding/confuse) that simulates manual development as much as possible, imitates some functions of Xcode, and avoids machine core 4.3, 2.1, 2.3.1, account surveys, etc.<br />Goal: **Simulate manually modify everything that can be changed** , which is why this tool only has a blacklist and no whitelist<br />The detailed functions are as follows (the basic functions are not described, see other tools for details):
<a name="82f2e3582d1466241460f1564b36b2a6"></a>
## Completed
The following functions are supported:

1. Blacklist (secondary) filtering, freely control the obfuscated content of each function, and adapt to almost all projects.
2. Confusion percentage control, you can freely adjust according to the actual needs of your own project
3. Smart noun substitution:
   1. When renaming, use the combination of related type existing information + similar semantics + type + some old vocabulary, and filter sensitive words. At the same time, users can also customize sensitive words.~~Deprecate'random word brainless combination'~~
   2. Different types of members with the same name -> different types of members with different names, and different types of different name members -> different types of members with the same name, simulating normal development. Members refer to methods, attributes, and functions
4. Intelligent identification of unmodifiable parts: Identifying systems, third parties, and Pod methods through types and inheritance chains is not a'simple' equality judgment, for example:
   1. Class method: + (void)init; in principle, it can be changed anywhere
   2. Object method:-(void)reloadData; can be changed if it is not a subclass of UITableView
   3. Property: @property (readonly) NSUInteger length; it can be changed if it is not a subclass of NSString
<a name="7e02145ffab0f7184b0a6b92e79d9acd"></a>
### General part

1. [Project Configuration], as long as you select the project path, other default configurations will be automatically completed
   1. Global setting "Ignore path", support regular, better use with blacklist
   2. ' xcodeproj' setting, for multiple xcodeproj projects and xx.xcodeproj is not in the project root directory
   3. 'Scheme' is confused and consistent with Xcode
   4. 'Debug mode', It is convenient to view the comparison before and after the modification in the source file, and insert some special annotations to facilitate the location of the bug. 
   5. 'Hybrid mode', this mode is used to process the swift call oc part of the mixed project, to ensure that the call relationship is maintained after confusion
   6. 'proto' setting, used for separate obfuscation of protobuf files
   7. 'Environmental inspection mode' setting, which is convenient for correcting irregular codes in advance
   8. 'Reference project root path' setting, read the word and UUID of the reference project
   9. 'Sensitive words' filtering
   10. 'Close Output', annotated NSLog, print and other debugging statements
   11. '**Version iteration confusion**', iteratively update after review, continue to use the last time (you can also choose the version arbitrarily) to obfuscate the record incremental confusion, maintain version continuity, and simulate normal development. Advantages: Development and obfuscation are synchronized and independent . The main functions currently support update confusion
2. ~~[Antivirus], ~~[~~Xcode poisoning, XCSSET Malware~~](https://juejin.cn/post/6936535178118430733)
   1. ~~'UUID suffix', the virus will randomly insert UUID with a fixed suffix, regular scanning~~
   2. ~~'Script path feature', a suspicious script will be executed before virus compilation, support regular scanning~~
   3. ~~'Run script code flag', a suspicious script code will be executed before virus compilation, support regular scanning~~
3. [Resource replacement], specify the resource folder that needs to be replaced before obfuscation , and automatically replace the file with the same name, which is convenient and quick
4. [Modify sks]，modify the layout and node names of sks files in SpriteKit
   1. 'Run splicing name', which is used for the image name generated by splicing strings at runtime
5. [Remove comment], identify single-line, multi-line comments
6. [Modify picture], each sub-function can be run independently
   1. 'Custom path', convenient for debugging and targeted confusion
   2. 'Custom RGBA', 'RGBA Offset', specify random color modificatio
   3. 'Theme color', generate a unified color style
   4. 'Hue shift', 'saturation shift', 'lightness shift', detail adjustment
   5. 'Pixel Points', local pixel fine-tuning
   6. 'Quality adjustment', 'Size offset', overall control
   7. 'Mode modification', multiple modes support
7. [Modify Lottie], simulate the real Lottie file structure, modify and expand the source file, basically does not affect the actual effect
8. [Modify file attributes], such as creation time, access time, modification time
9. [Modify item], no need to delete Cocoapods
   1. Can be set to'modify uuid', completely refurbished
   2. Customize the name of the'modify target', and the associated information will be updated synchronously
10. [File comparison], compare the file modification percentage before and after obfuscatio
    1. ‘Reference path’, customize the original project
    2. ‘Maximum limit’, skip the comparison if it exceeds the limit
11. Automatic source code backup
<a name="279a46203c9fe475b30ffab43dad6dba"></a>
### Objective-C

1. [Modify control flow], and replace the logical operations in the if conditional statement with equivalent values
2. [Rename global method], you can set the 'prefix'
3. [Rename picture], intelligent noun replacement, automatically process binary sks files, automatically correct the situation that the picture name and the xcassets folder name do not correspond
   1. You can set the 'Run splicing name', which is used for the image name generated by splicing strings at runtime
   2. You can set the 'rename associated string' to modify the situation where the string is equal to the picture name
   3. You can set the 'specified ignore length', the length of the picture name is less than the specified length is a dangerous name, it will be ignored
   4. You can set 'ignore danger', which has the same name as the dictionary key, and it will be ignored
   5. You can set 'associated files', other files containing picture names
4. [Insert picture], automatically insert pictures, and simulate manual calls according to context and type, and the number of inserts can be specified
5. [Rename member variables], supports synthesisize and arrow syntax recognition
6. [Rename property], support all types of @property , Support Protobuf, advantages:
   1. Identify grammar, identify type, inheritance relationship, **attribute name confusion and class name (including inheritance chain) association** , automatically identify system attributes
   2. You can set the 'Model suffix' to filter by the suffix of the class name, which is convenient for filtering Model
   3. You can set 'Model Mapping' to automatically insert the mapping relationship (customized, and automatically complete other attributes) to ensure that the background data is matched
7. [Insert property], creation, assignment, and modification are all associated with existing types, smart noun replacement
   1. 'Percentage control'
   2. You can set the 'Model suffix' to filter by the suffix of the class name, the purpose: to avoid Model archiving or data transfer model failure
   3. Can be executed multiple times, the index x2 increases
8. [Rename method], similar to Xcode's Rename function , advantages:
   1. Syntax-related, identification of types, inheritance relationships, support for **multi-parameter modification, confusion of method names, class names (including inheritance chains) and type associations** , automatic identification of system methods
9. [Modify closure], extract the closure content in the method body, encapsulate it into a method and call it
10. [Split method], split the method body, disrupt the function stack structure, can be split multiple times
11. [Insert method], insert and call context-related methods, bid farewell to "garbage code", advantages:
    1. According to the return value type of the method, create the corresponding method in the category. At the same time , the return value of the original method is encapsulated and use (local variables, attributes, formal parameters) called.
    2. Can be executed multiple times, the index x2 increases
12. [Insert control flow] to change the code execution order
13. [Merge method], interspersed merge code, and changed the function stack structure
14. [Modify method], simulating manual package call, advantages:
    1. **Split the call** to the original method **and adjust** it **locally according to the parameter type (support inheritance)** . For details, see the [summary table of supported parameter types.](https://www.yuque.com/docs/share/315b72d9-28f9-4fa6-bf20-c40d94f2253a?translate=en)
    2. Supports 'exchange parameters', randomly exchanging parameter positions, mainly used for multi-parameter methods
    3. Can be executed multiple times, the index x2 increases
15. [Rename global variables], smart noun substitution
16. [Modify global variables], replace global variable names, **convert global variables into global functions** , and confuse string variable values
17. [Insert local variable], single-line compound call becomes simple multi-line call, change the execution order
18. [Modify local variable], simulate manual encapsulation call, variable name association type, advantages:
    1. Local variable values remain unchanged during operation, see the [summary table of supported types for](https://www.yuque.com/docs/share/90444065-4f4e-49c8-9e1a-5bd3d3b4f84d?translate=en) details
    2. Can be executed multiple times, the index x2 increases
19. [Rename multilingual], using a system of direct or indirect methods **NSLocalizedString** , **NSLocalizedStringFromTable** multilingual modified，[The custom packaging methods require manual processing](https://520coding.yuque.com/docs/share/de45751a-c629-4737-84ad-251fb2502123?translate=en)
20. [Modify string], support arbitrary string, encryption processing (hard code -> memory), the original string is kept in the comment for easy inspection
    1. Set the'minimum length' filter
    2. You can also set the " effective number" to use together
21. [Modify xib, storyboard], automatically insert the view, and modify the internal structure properties
22. [Modify font] , randomly fine-tune the font used in the project, and identify macros
23. [Modify color], randomly shift the color of the UI controls in the project, and identify the macro
24. [UI layout offset], support Frame, Masonry, SDAutoLayout common layout fine-tuning
25. [Insert file], generate other files (Combined with network, storage, and MVC to ensure that the code has high relevance and practical significance), automatic high-related calls in the project ; **Note:** (Under the project root path, a folder of " **other_xxx_file** " will be generated , and the sub-option **Target** controls Import method, if it is empty, you need to manually import, just drag the generated folder into the project; otherwise, automatically import)
26. [Insert text], Generate json, txt, plist and other common text files, automatic high-related calls in the project  ; **note:** (under the project root path, a folder of " **other_xxx_text** " will be generated , and the generated files will be **automatically imported** )
27. [Modify Class], modify the order of member variables, attributes, method declarations and definitions
28. [Rename class], the class name is not limited (for example: my, My), you can specify to add a prefix, support class and category name|struct|protocol，advantages:
    1. Smart noun substitution
    2. Can be set to'rename files with the same name'
    3. You can set'rename similar strings', (ignore | equal | include) three modes
    4. Added 'correct non-standard dot grammar', calling for non-standard dot grammar (methods are called as attributes)
<a name="015937695b202fc108bd5bc9b3283082"></a>
### C++

1. [Rename attribute], support all type attributes, recognize syntax, recognize type, inherit
2. [Insert attributes], insert attributes (member variables) and call each other to modify, automatic initialization, destruction, and assignment modification in other methods and other similar manual operations, support'percentage control'
3. [Rename method], similar to Xcode's Rename function, identifying types, templates, overloading, rewriting, inheritance, etc.
4. [Modification method], use overloading technology to modify the function prototype and call the modified parameter
5. [Modify string], support arbitrary string, encryption processing (hard code -> memory), the original string is kept in the comment for easy inspection
   1. Set the'minimum length' filter
   2. You can also set the " effective number" to use together
6. [Rename class], support template and other types
   1. Can switch the old mode
   2. Prefix setting
   3. Can be set to'rename files with the same name'
<a name="ea78561d0c1d5c21d3e2c93d960472e5"></a>
### Cocos2d-x
This part of the function is integrated into C++ and supports cocos2dx automatic filtering
<a name="47038e8338f9e18ef9eaba0ea5effb80"></a>
### Swift
Adapt to Swift5.5, the SPM package management project has not yet been tested

1. [Modify control flow], replace logical operations and optional binding in if conditional statements with equivalent
2. [Rename global method] to automatically identify system methods
   1. Can set 'parameter label', support hidden parameter label and trailing closure usage
   2. Can set 'prefix'
3. [Rename picture], smart noun replacement, automatically process binary sks files, and automatically correct the situation where the picture name and the xcassets folder name do not correspond to each other
   1. You can set the 'Run splicing name', which is used for the image name generated by splicing strings at runtime
   2. You can set the 'specified ignore length', the length of the picture name is less than the specified length is a dangerous name, it will be ignored
   3. You can set 'ignore danger', which has the same name as the dictionary key, and it will be ignored
   4. You can set 'associated files', other files containing picture names
4. [Rename lottie] to adapt to various scenarios
   1. You can set the 'run splicing name', which is used for the lottie name generated by string splicing at runtime
   2. You can set the 'specified Ignore Length', if the length of the lottie name is less than the specified length, it is a dangerous name and will be ignored
   3. You can set 'ignore danger', which has the same name as the dictionary key, and it will be ignored
5. [Insert picture], which automatically inserts pictures, and simulates manual calls according to the context and type, and the number of insertions can be specified
6. [rename enum], identify associated and primitive values
   1. 'Original value' can be set to refine the control range
7. [Rename attribute], basic function, without too much description, advantages:
   1. Similar to OC [Rename attribute], identify inheritance chain and nested type, support storage and calculation of attributes, observers, wrappers, class attributes
   2. You can set the 'Model suffix' to filter by the suffix of the class name, which is convenient for filtering Model
   3. You can set the 'Model mapping', automatically insert the mapping relationship, and match the background data
8. [Insert property], use calculated properties to wrap and call and replace the original properties
   1. Support storage and calculation of attributes, observers, wrappers, class attributes
   2. You can set the 'Model suffix' to filter by the suffix of the class name, the purpose: to avoid Model archiving or data transfer model failure
9. [Rename method], the basic functions are renamed similar to other tools, without too much description, advantages: 
   1. Can set 'parameter label', support hidden parameter label and trailing closure usage
   2. Identification of inheritance chain nested types, support for (class, struct, enum) static methods and instance methods, and optional chains, etc.
10. [Modify closure], extract the closure content in the method body, encapsulate it into a method and call it
11. [Split method], split the method body, disrupt the function stack structure, and can be split multiple times
12. [Insert method], encapsulate the return value of the original method and use the context to call additional associated methods, saying goodbye to "garbage code"
13. [Modification method], use overloading technology to modify the function prototype and call the modified parameter，support exchange parameters
    1. Supports 'exchange parameters', randomly exchanging parameter positions, mainly used for multi-parameter methods
    2. ‘Dynamic dispatch’, changing the method calling method
14. [Rename global variables], smart noun substitution
15. [Modify font] , randomly fine-tune the font used in the project, and identify macros
16. [Modify color], randomly shift the color of UI controls in the project
17. [UI layout offset], support Frame, SnapKit, common layout fine-tuning
18. [Insert local variable], split single-line compound calls, change the execution order
19. [Modify local variable], simulate manual encapsulation call, variable name association type (support nesting), advantages:
    1. The value of the local variable remains unchanged during operation. For details, see the summary table of supported types.
    2. Can be executed multiple times, the index x2 increases
20. [Rename multi-language], support custom method multi-language processing
21. [Modify string], recognize single-line, multi-line, string interpolation, and extended string. After the modification, it can be freely combined by a variety of methods such as encryption and split character groups, and the comments of the original characters are reserved for easy inspection
    1. Set the'minimum length' filter
    2. You can also set the "effective number" to use together
22. [Modify xib, storyboard], automatically insert the view, and modify the internal structure properties
23. [Insert file], close to actual development (combined with network, storage, MVC, xib, etc., to ensure that the code has high relevance and practical significance), and strengthen contextual relevance. Can set 'file name prefix', set 'Target import' in the same way as OC
24. [Insert text], generate common text files such as json, txt, plist, etc., and automatically high-related calls in the project (introduction of attributes, initialization, automatic destruction, etc.). Note: (under the project root path, the folder "other_xxx_text" will be generated, and the generated files will be automatically imported)
25. [Rename class], the class name is not limited (for example: my, My), identify nested types and typealias, support class|struct|enum|protocol
    1. Can be set to'rename files with the same name'
    2. 'Prefix' can be set
> Note: At present, the Swift and OC mixed project, the OC calling Swift part will not be processed for the time being, and will be optimized in the future.

<a name="6554a51551d5572e2cd7d848844e9660"></a>
## Planning
Update iterations will be carried out in the following order

1. Objective-C (95%), mainly to improve the versatility and stability of the tool, and strengthen the function
   1. Audio and video files are used less and will be added later
2. Swift (95%), under development...
   1. Enhanced performance
3. C++ (60%), under development...
   1. Method: Insert
   2. Property: modify
   3. Global variables: modify
4. Lua (0%) is too specific, and it is temporarily closed. If users have this demand, we will refactor this part
5. C# (0%), I don’t use much in actual projects, so I ranked last, depending on user needs before deciding
6. Other functions:
   1. Fast obfuscation mode
<a name="af444a353c9380bc9aa8aec067937316"></a>
# Graphic introduction
Run the APP rendering, please read the [tool usage tutorial](https://www.yuque.com/docs/share/cd0968ac-9c7e-415f-9e7c-1460b85e80e8) in detail before use<br />![image.png](https://cdn.nlark.com/yuque/0/2021/png/213807/1623167266244-4978d5ed-0b2c-42b5-80c4-1b44e4ff7f96.png#averageHue=%233a9b1d&clientId=u4ef53c93-4376-4&errorMessage=unknown%20error&from=paste&height=877&id=ufbdd65fd&originHeight=1754&originWidth=2532&originalType=binary&ratio=2&rotation=0&showTitle=false&size=443560&status=error&style=none&taskId=ue83d9a90-392f-4558-9b46-f06320d2c45&title=&width=1266)
<a name="c318fa67bf88d5d842cee03115743b4b"></a>
# Update log
<h3 id="L8Epu">v8.1.4 (2025.08.01) Hotfix</h3>

1. Enhanced OC [Modify Local Variables] with new strategy selection
2. Fixed an issue with duplicate variable names in the old OC [Modify String] mode
3. Optimized basic template code

[View more historical update records](https://www.yuque.com/docs/share/39f2f60e-b6a8-443b-b005-b9364fb79b95?translate=en)
<a name="41b9f638a3e62c9449ec872644258c8d"></a>
# Thanks for the feedback
[shizu2014](https://github.com/shizu2014)、[myhonior](https://github.com/myhonior)、[imbahong](https://github.com/imbahong)、[tabier008](https://github.com/tabier008)
<a name="0ae29cb26e944f357b114cccc4c1211b"></a>
# Link navigation

1. [Tool usage tutorial](https://www.yuque.com/docs/share/cd0968ac-9c7e-415f-9e7c-1460b85e80e8)
2. [Software Questions and Answers (Q&A)](https://www.yuque.com/docs/share/4a87ec96-80fe-4d25-873d-93cb428b3e15?translate=en)
3. [OC[Modification method] Parameter type summary table](https://www.yuque.com/docs/share/315b72d9-28f9-4fa6-bf20-c40d94f2253a?translate=en)
4. [OC[Modify local variables] Modify local variables-summary table of supported types](https://www.yuque.com/docs/share/90444065-4f4e-49c8-9e1a-5bd3d3b4f84d?translate=en)
5. [OC[Rename multilingual] processing custom packaging method](https://520coding.yuque.com/docs/share/de45751a-c629-4737-84ad-251fb2502123?translate=en)
6. [Swift[Modification method] Parameter type summary table](https://520coding.yuque.com/docs/share/cd70e83b-4ab4-40e5-b719-70f214e869c8)
