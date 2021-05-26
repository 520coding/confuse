<a name="54fa66eaba498942a1604ffa591838ac"></a>
# ![1593768128247-016fe60b-8853-48fb-8b76-f9f702b83db5.png](https://cdn.nlark.com/yuque/0/2020/png/213807/1606304234500-46a10b02-f83d-4996-99fc-ce092241ea7c.png#height=100&id=SslN0&name=1593768128247-016fe60b-8853-48fb-8b76-f9f702b83db5.png&originHeight=200&originWidth=200&originalType=binary&size=28522&status=done&style=shadow&width=100)
<a name="HGXXr"></a>
<a name="174be9787bb85687706b11dfa538cd99"></a>
# Foreword
By chance, I came across iOS [Vest Bag Business](https://www.yuque.com/docs/share/7e70244c-5dea-4035-b634-65cc082097da?# "Vest Bag Introduction"), and I have used it in the early stage. Others currently on the market Get the tools, the actual effect is not ideal. After a lot of practice, a fully functional [Confusion Tool](https://github.com/520coding/confuse) has been developed. The main functions of the tool OC, C++, Swift have been packaged into Mac applications, and other functions are still being packaged, so stay tuned.
<a name="9716a56c8b2aa1819920e42731952b21"></a>
# Tips
In order to let everyone get started quickly and compare the confusion effect, a new test project [**confuse_test**](https://github.com/520coding/confuse/tree/master/confuse_test) was created. If you encounter any problems during actual use Questions, welcome to extend the test project, please indicate the bug details in the project, there will be rewards.
> Instructions for the old version before 1.2.0:
> Introduction: No grammar and compilation requirements are involved, but partial omissions or corrections may occur after confusion, please add to the blacklist filter by yourself.
> Applicable projects: RN and other mixed projects that have not yet been adapted.
> Conditions of use: temporarily unavailable, reopen later

<a name="d414d8542c4c96e2fa3cda81b4a61dc1"></a>
# Readme
<a name="6e674183b5d2f1af15baaa27bb7c93b2"></a>
### The essence of the vest:

1. Reduce the repetition rate in the first stage. The initial version of my development is basically similar to other tools currently on the market, mainly the basic function of "name" global replacement
1. In the second stage, the similarity is reduced (normal distribution of the same elements). The tool has been greatly improved after optimization and continuous reconstruction, and it basically meets the requirements in this respect. For details, see the following function introduction. There are two sides to everything. The more powerful the function, the longer it takes to confuse. If your project is large, it is possible to confuse for a few hours. Please don't take it offense, as the follow-up continues to optimize.
<a name="fc8a03eacc987f4c5e94e6dc0086ea50"></a>
### Distinguish the pros and cons of tools
In fact, to identify the pros and cons of a tool, just look at the following points:

1. Can modify all attributes, methods, and all parameter names of methods
1. The method with block parameters, a typical network request
> For example: + (BOOL)post:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpRequestResponse)success error:(HttpRequestResponse)error;

3. The length of the changed name of the method name and the attribute name (this tool can guarantee that 60~80% of the changed name is a common word, such as name, title, etc. and ensure that it does not conflict with the system, ~~ completely abandon the simple The practice of relying on a large number of word libraries to ensure the uniqueness of naming~~, truly simulating manual development)
3. Modify the layout (Frame, Masonry, SDAutoLayout)
3. Is the code inserted or "garbage" (this tool creates custom controls by encapsulating network requests, and uses MVC mode associations between files to completely bid farewell to "garbage" and realize the fake and the real).
3. Not to mention "Who else..." can identify macros, distinguish contextual content such as inheritance chains, and intelligently identify unmodifiable parts
> For example: + (void)init;- (void)reloadData; basically can be changed, how many can it be done? "

7. Normal projects (or third-party libraries) are obfuscated and basically do not report errors (except for some individual [not rigorous syntax](https://www.yuque.com/docs/share/4a87ec96-80fe-4d25-873d-93cb428b3e15?#5sCql) error after causing confusion)


<br />You are also welcome to use different tools to confuse test projects [**confuse_test**](https://github.com/520coding/confuse/tree/master/confuse_test) or third-party open source library projects to compare the effects.
<a name="426215c094f184f34acdb12593ddb1fc"></a>
# Features
confuse is a [confuse tool](https://github.com/520coding/confuse), which simulates manual development as much as possible, imitates some functions of Xcode, and avoids machine core 4.3, 2.1, 2.3.1, account surveys, etc. <br />Goal: **simulate manual modification of everything that can be changed**, which is why this tool only has a blacklist and no whitelist.<br />The detailed functions are as follows (the basic functions are not described, see other tools for details ):
<a name="82f2e3582d1466241460f1564b36b2a6"></a>
## completed
The following functions are supported:

1. Blacklist (secondary) filtering, freely control the obfuscated content of each function, and adapt to almost all projects.
1. Confusion percentage control, you can freely adjust it according to the actual needs of your own project
1. Smart noun substitution:
   1. When renaming, use the combination of related type existing information + similar semantics + type + part of the old vocabulary, and filter sensitive words. At the same time, users can also customize sensitive words, ~~abandon ‘random word brainless combination’~~
   1. Different types of members with the same name -> different types of members with different names, and different types of different name members -> different types of members with the same name, simulating normal development. Members refer to methods, attributes, and functions
4. Intelligent identification of unmodifiable parts: Identifying systems, third parties, and Pod methods through types and inheritance chains is not a ‘simple’ equality judgment, for example:
   1. Class method: + (void)init; in principle, it can be changed anywhere
   1. Object method:-(void)reloadData; it can be changed if it is not a subclass of UITableView
   1. Property: @property (readonly) NSUInteger length; it can be changed if it is not a subclass of NSString
<a name="7e02145ffab0f7184b0a6b92e79d9acd"></a>
### General part

1. [Project Configuration], as long as you select the project path, other default configurations will be automatically completed
   1. Globally set ‘Ignore Path’, support regular, better to use with blacklist
   1. ‘xcodeproj’ setting, for multiple xcodeproj projects and xx.xcodeproj not in the project root directory
   1. ‘Scheme’ is confused and consistent with Xcode
   1. "Reference project root path" setting, read the word and UUID of the reference project
   1. ‘Sensitive words’ filtering
   1. ‘**Version iteration confusion**’, iteratively update after review, continue to use the last time (you can also choose the version arbitrarily) to obfuscate the record incremental confusion, maintain version continuity, and simulate normal development. Advantages: Synchronize development and obfuscation and are independent of each other. The main functions currently support update confusion
2. [Virus killing], [Xcode poisoning, XCSSET Malware](https://juejin.cn/post/6936535178118430733)
   1. ‘UUID suffix’, the virus will randomly insert UUID with a fixed suffix, regular scanning
   1. ‘Script path feature’, a suspicious script will be executed before virus compilation, and regular scanning is supported
   1. ‘Run script code flag’, a suspicious script code will be executed before virus compilation, support regular scanning
3. [Resource replacement], specify the resource folder to be replaced before obfuscation, and automatically replace the file with the same name, which is convenient and quick
3. [Edit picture], quality modification, size shift, local pixel fine-tuning
3. [Modify file attributes], such as creation time, access time, modification time
3. [Modify item], no need to delete Cocoapods
   1. You can set ‘modify uuid’ for complete refurbishment
   1. Customize the ‘modify target’ name, and update the associated information simultaneously
7. Automatic source code backup
<a name="279a46203c9fe475b30ffab43dad6dba"></a>
### Objective-C

1. [Delete comment], you can set ‘retain spaces’ and ‘preserve pragma’ to facilitate viewing during testing
1. [Rename picture], intelligent noun replacement, automatically correct the situation that the picture name and the xcassets folder name do not correspond
   1. You can set a ‘run splicing name’, which is used for the picture name generated by string splicing at runtime
   1. You can set ‘rename associated string to modify the situation where the string is equal to the picture name
   1. The switch of ‘ignore dangerous names’ can be set
3. [Insert Picture], automatically insert a picture, and simulate manual call according to the context and type, and the number of inserts can be specified
3. [Rename property], support all types of @property, advantages:
   1. Identify grammar, identify type, inheritance relationship, **attribute name confusion and class name (including inheritance chain) association**, automatically identify system attributes
   1. File name Model suffix filtering can be set
5. [Insert property], associate existing types, smart noun replacement
   1. ‘Percentage Control’
   1. ‘Model suffix’ switch, purpose: to avoid failure of Model archiving or data transfer to model
   1. It can be executed multiple times, and the index x2 increases
6. [Rename method], similar to Xcode's Rename function, advantages:
   1. Syntax-related, type recognition, inheritance relationship, support **multi-parameter modification, method name confusion, class name (including inheritance chain) and type association**, automatic identification of system methods
7. [Insert method], insert and call context related methods, bid farewell to "garbage code", advantages:
   1. According to the return value type of the method, create the corresponding method in the category. At the same time, the return value of the original method is encapsulated and called.
   1. It can be executed multiple times, and the index x2 increases
8. [Modification method], simulating manual package call, advantages:
   1. Make a **split call to the original method and partially adjust it according to the parameter type (support inheritance)**. For details, see [Summary of Supported Parameter Types](https://www.yuque.com/docs/share/315b72d9-28f9-4fa6-bf20-c40d94f2253a?#《修改方法-支持参数类型汇总表》)
   1. It can be executed multiple times, and the index x2 increases
9. [Rename global variable], smart noun replacement
9. [Modify global variables], replace global variable names, ** convert global variables into global functions**, confuse string variable values
9. [Modify local variables], simulate manual encapsulation call, variable name association type, advantages:
   1. The value of the local variable remains unchanged during operation. For details, see [Summary of Supported Types](https://www.yuque.com/docs/share/90444065-4f4e-49c8-9e1a-5bd3d3b4f84d?#《修改局部变量-支持类型汇总表》)
   1. It can be executed multiple times, and the index x2 increases
12. [Rename Multi-Language], modify the multi-language that directly or indirectly use the system methods **NSLocalizedString** and **NSLocalizedStringFromTable**
12. [Modify string], support any string, encryption processing (hard code -> memory), the original string is kept in the comment for easy inspection
    1. Set the ‘minimum length’ filter
    1. You can also set the "effective number" to use together
14. [Modify xib, storyboard], automatically insert the view, and modify the internal structure properties
14. [Modify font], randomly fine-tune the font used in the project and identify macros
14. [Modify color], randomly shift the color of UI controls in the project, and identify the macro
14. [UI layout offset], support frame, Mansonry, SDAutoLayout common layout fine-tuning
14. [Insert file], generate other files (encapsulate network requests, create custom controls, simulate normal development), and call them automatically in the project; **Note:** (Under the project root path, "**other_xxx_file* will be generated" *" folder, the sub-option **Target** controls the import method, if it is empty, you need to manually import it, just drag the generated folder into the project; otherwise, automatically import)
14. [Insert text], generate text files such as json, txt, doc, plist, etc., which are automatically called in the project; **Note:** (Under the project root path, a folder of "**other_xxx_text**" will be generated, The generated file will **automatically import**)
14. [Rename class], the class name is not limited (for example: my, My), you can specify to add a prefix, advantages:
    1. Smart Noun Substitution
    1. ‘Rename files with the same name’ can be set
    1. You can set ‘rename similar strings’, (ignore|equal|contains) three settings
    1. Added ‘correct non-standard dot grammar’ to call for non-standard dot grammar (methods are used as attribute calls)
<a name="015937695b202fc108bd5bc9b3283082"></a>
### C++

1. [Rename attribute], support all type attributes, recognize grammar, recognize type, inherit
2. [Insert attributes], insert attributes (member variables) and call each other to modify, automatically initialize, destroy, and assign and modify in other methods and other similar manual operations, support ‘percentage control’
2. [Rename method], similar to Xcode's Rename function, identifying types, templates, overloading, rewriting, inheritance, etc.
4. [Modification method], use overloading technology to modify the function prototype and call the modified formal parameters
4. [Modify string], support any string, encryption processing (hard code -> memory), the original string is kept in the comment for easy inspection
   1. Set the ‘minimum length’ filter
   1. You can also set the "effective number" to use together
6. [Rename class], support template and other types
   1. Can switch the old mode
   1. Prefix setting
   1. ‘Rename files with the same name’ can be set
<a name="ea78561d0c1d5c21d3e2c93d960472e5"></a>
### Cocos2d-x
This part of the function is integrated into C++ and supports cocos2dx automatic filtering
<a name="47038e8338f9e18ef9eaba0ea5effb80"></a>
### Swift
Adapt to Swift5.3, the SPM package management project has not yet been tested

1. [Rename attribute], basic function, not too much description, advantages:
   1. Similar to OC[Rename Attribute], identify inheritance chain and nested type, support storage and calculation of attributes, observers, wrappers, class attributes
   1. File name Model suffix filtering can be set
2. [Rename method], the basic functions are renamed similar to other tools, without too much description, advantages: identification of inheritance chain nested types, support for (class, struct, enum) static methods and instance methods, and optional chains Wait
2. [Modify string], recognize single-line, multi-line, string interpolation, and extended string. After the modification, it can be freely combined by a variety of methods such as encryption and split character groups, and the comments of the original characters are reserved for easy inspection
   1. Set the ‘minimum length’ filter
   1. You can also set the "effective number" to use together
4. [Rename class], the class name is not restricted (for example: my, My), identify nested types and typealias, support class, struct, enum, protocol
   1. ‘Rename files with the same name’ can be set
   1. ‘Prefix’ can be set
> Note: In the current mixed project of Swift and OC, the mutual call between OC and Swift needs to be added to the blacklist manually, which will be optimized in the future.

<a name="6554a51551d5572e2cd7d848844e9660"></a>
## planning
Update iterations will be carried out in the following order

1. Objective-C (95%), mainly to improve the versatility and stability of the tool, and strengthen the function
   1. Audio and video files are used less and will be added later
2. Swift (50%), under development...
   1. Insert attributes
   1. Modification method
   1. Insert a file
3. C++ (60%), under development...
   1. Method: Insert
   1. Attribute: modify
   1. Global variables: modify
   1. Local variables: modify
4. Lua (0%) is too targeted and will not be open for the time being. I don’t plan to refactor for the time being. I need to talk about it.
4. C# (0%), I don’t use much in my actual projects, so I ranked last, depending on user needs before deciding
4. Other functions:
   1. Fast obfuscation mode
<a name="af444a353c9380bc9aa8aec067937316"></a>
# Graphic introduction
Run the APP rendering, please read the [Tool Usage Tutorial](https://www.yuque.com/docs/share/edd2603f-d09d-4795-ae71-b42419b99446?#《confuse使用说明》)<br / >![image.png](https://cdn.nlark.com/yuque/0/2020/png/213807/1607931800015-f60e682f-6ef3-4c5a-bfc5-4c88222bb1a7.png#height=540&id=Ai791&margin=%5Bobject%20Object%5D&name=image.png&originHeight=1080&originWidth=1920&originalType=binary&size=489209&status=done&style=none&width=960)
<a name="c318fa67bf88d5d842cee03115743b4b"></a>
# Update log
<a name="FnHXN"></a>
### v4.4.0 (2021.05.17)

1. Added Swift [Modify String], which recognizes single-line, multi-line, string interpolation, and extended string. After the change, it can be freely combined by multiple methods such as encryption and split character groups, and retains the original character comments Easy to check
   1. Set the ‘minimum length’ filter
   1. You can also set the "effective number" to use together
2. Optimize OC[Layout Offset], fix OC[Layout Offset] operation logic priority change problem, improve recognition accuracy (500M project test passed once)
2. Optimize OC [insert file] and add Debug test for fast positioning and time-consuming operations
2. Fix the bug of OC[Rename Attribute], attribute and instance variable have the same name with small probability
2. Fix OC[Insert Attribute], bug under special circumstances
2. Optimize [Rename category] and [Modify project], large projects may be confused for a long time or stuck, which has been improved at present (500M project passed the test once, within 3 minutes)
2. Fix that the percentage setting of trial mode may be abnormal
2. Fix OC [insert method] incorrectly changed in previous versions, resulting in only insert method and missed call problem

[View more historical update records](https://www.yuque.com/docs/share/39f2f60e-b6a8-443b-b005-b9364fb79b95?#《confuse更新说明》)
<a name="41b9f638a3e62c9449ec872644258c8d"></a>
# Thanks for the feedback
[shizu2014](https://github.com/shizu2014), [myhonior](https://github.com/myhonior), [imbahong](https://github.com/imbahong), [tabier008](https://github.com/tabier008)
<a name="0ae29cb26e944f357b114cccc4c1211b"></a>
# Link navigation

1. [Tool usage tutorial](https://www.yuque.com/docs/share/edd2603f-d09d-4795-ae71-b42419b99446?#《confuse使用说明》)
1. [Questions and Answers on Software Usage (Q&A)](https://www.yuque.com/docs/share/4a87ec96-80fe-4d25-873d-93cb428b3e15?#《软件使用问答（Q&A）》)
1. [[Modification Method] Parameter Type Summary Table](https://www.yuque.com/docs/share/315b72d9-28f9-4fa6-bf20-c40d94f2253a?#《修改方法-支持参数类型汇总表》)
1. [[Modify Local Variables] Modify Local Variables-Support Type Summary Table](https://www.yuque.com/docs/share/90444065-4f4e-49c8-9e1a-5bd3d3b4f84d?#《修改局部变量-支持类型汇总表》)
