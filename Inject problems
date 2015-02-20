# "Problem: Injection Doesn't Occur":#no-injection
** "Incorrect Injection Point Declaration":#bad-metadata
** "Metadata Stripping":#metadata-stripping
** "Injected Properties Are Null In Constructor":#null-in-constructor
# "Problem: Things Work For A While And Then Mysteriously Stop":#mysteriously-stops
# "Problem: Event Dispatch Doesn't Work As Expected":#event-dispatch-broken
# "Problem: Mediator Not Running onRegister":#mediator-not-running-onregister
# "Error: Call to a possibly undefined method X":#package-property
# "Error: Injector missing rule for X":#injection-errors
** "Missing Injection Mapping":#missing-injection-mapping
** "Inconsistent Injection Mapping":#inconsistent-injection-mapping
# "Other Problems":#other

h1(#no-injection). Problem: Injection Doesn't Occur

h2(#bad-metadata). Incorrect Injection Point Declaration

Here is how a correctly defined property injection point looks:

<pre>
[Inject]
public var someValue:SomeType;
</pre>

*Note:* the injected property *must* be public. This is wrong:

<pre>
[Inject]
private var someValue:SomeType;
</pre>

*Note:* Metadata is case-sensitive. These are wrong:

<pre>
[inject]
[INJECT]
[InJect]
</pre>

*Note:* A semi-colon after your [Inject] will stop it working. This is wrong:

<pre>
[Inject];
public var someValue:SomeType;
</pre>

Incorrect injection point declaration won't throw errors, your application just won't work correctly.

h2(#metadata-stripping). Metadata Stripping

The Flash/Flex compiler will strip out non-standard metadata unless you tell it not to - this includes the [Inject] and [PostConstruct] metadata that Robotlegs needs to function correctly. Sometimes, when building an AIR application for example, the metadata will stay intact while debugging but will be stripped out when you publish your release build. You need to tell the compiler that you want it to keep the [Inject] and [PostConstruct] metadata tags.

The Robotlegs SWC includes the required compiler arguments for you, but when linking against the source you will need to add the arguments yourself:

h4. Flex/FlashBuilder Solution

Right-click your project and click Properties. Go to "Flex Compiler", and under "Additional compiler arguments" add:

<pre>-keep-as3-metadata+=Inject -keep-as3-metadata+=PostConstruct</pre>

*Note:* This is not necessary if you are compiling against the Robotlegs SWC. The SWC includes these arguments for you.

h4. Flash IDE Solution

Select "Export SWC" in your publish settings. This will force the Flash compiler to keep all metadata intact.

h2(#null-in-constructor). Injected Properties Are Null In Constructor

Dependencies injected via setter/property injection are not available until *after* the instance has been created - it's pretty easy to visualize, just imagine doing it by hand: first you create the new instance and *then* you set the properties.

h4. PostConstruct Solution

The most common solution to this problem is to remove the code from your constructor and place it into a public method with [PostConstruct] metadata placed above it, like so:

<pre>
[PostConstruct]
public function init():void
{
    // all dependencies have now been satisfied
}
</pre>

*Note:* [PostConstruct] metadata is case-sensitive.


h4. Constructor Injection Solution

Instead of using property/setter injection you can use constructor injection, simply define your dependencies as constructor arguments.

*A word of warning about constructor injection:* Due to a bug in the Flash Player (pre 10.1), full type information for constructor arguments is only available after the affected class has been instantiated at least once. To work around this bug, SwiftSuspenders (the default DI/IoC framework that Robotlegs uses) checks if type information for the arguments is available when performing constructor injection. If not, SwiftSuspenders will create one throw-away instance of the class. Because of this behavior, *it is important not to start any complex processes in constructors of classes that are used with constructor injection*.

h1(#mysteriously-stops). Problem: Things Work For A While And Then Mysteriously Stop

Make sure to hang on to your context! We've seen a lot of people make this simple mistake. Consider the following (the WRONG way):

<pre>
public class HelloActionScript extends Sprite
{
	public function HelloActionScript()
	{
		var context:HelloContext = new HelloContext( this );
	}
}
</pre>

The problem here is that the context is scoped as a local variable, and as such it will be free for Garbage Collection pretty much straight away. The context might function for a little while, but at some point in time it will be GC'd and cease to exist.

h4. Solution - Hang on to your context!

<pre>
public class HelloActionScript extends Sprite
{
	private var context:HelloContext;

	public function HelloActionScript()
	{
		context = new HelloContext( this );
	}
}
</pre>

*Note:* keep a reference to your context instance.

h1(#event-dispatch-broken). Problem: Event Dispatch Doesn't Work As Expected

Make sure to override the *clone()* method of your custom event class. Events can not be re-dispatched without doing so - even non-bubbling events. It is considered best practice when creating custom events to override clone().

h1(#mediator-not-running-onregister). Problem: Mediator Not Running onRegister

*Check*: Have you created a mapping for this view-mediator pair? All mappings need to be provided manually.

*Check*: Is your view being added to the stage? The mediator onRegister() method runs after the view has landed on stage. It's possible to addChild(view) without the view actually being added to the stage, if the parent is not on stage.

*Check*: If your view is definitely mapped to the mediator and is definitely being added to the stage: has your view hit the stage *before* the mapping was made?

*Note*: Generally you should aim to list your mediator mappings from the inside out - map the most deeply nested view first, and your contextView last. This ensures that if you have an init() function in your parent view that adds the internal children, and is triggered by the onRegister of the parent mediator, all the child mappings will already have been made before this code runs, and your views won't hit the stage before their mappings have been made.

h1(#package-property). Error: Call to a possibly undefined method X

Among other reasons this error could be the result of not following the AS3 naming conventions for packages, classes, methods, variables, and so on.

For example something like this:

<pre>
package controller 
{
	import model.MyModel;
	import org.robotlegs.mvcs.Command;
	
	public class MyCommand extends Command
	{
		[Inject]
		public var model:MyModel;
		
		[Inject]
		public var event:MyEvent;
		
		override public function execute():void
		{
			model.myMethod();
		}
	}
}
</pre>

would result in: *Error 1180:* Call to a possibly undefined method *myMethod*

and eventually a warning (depending on the SDK):

*Warning 3599:* Definition name is the same as an imported package name.
Unqualified references to that name will resolve to the package and not the definition. If a definition is named the same as a package that is in scope, then any unqualified references to that name will resolve to the package instead of the definition. This can result in unexpected errors when attempting to reference the variable. Any references to the definition need to be qualified to resolve to the definition and not the package.

h4. Solution - Package your classes properly

This would be incorrect: model.SomeModel
This would be better: domain.project.area.model.SomeModel

It wouldn't hurt to read the "Coding Conventions":http://help.adobe.com/en_US/AS2LCR/Flash_10.0/00000474.html again (*and again and again*).


h1(#injection-errors). Error: Injector missing rule for X

h2(#missing-injection-mapping). Missing Injection Mapping

The injector needs to be provided with a rule about how to fulfil each injection. If you have an [Inject] point, you must have a corresponding mapping on the injector, either directly through the injector mapping methods or through the commandMap, viewMap and mediatorMap.

h2(#inconsistent-injection-mapping). Inconsistent Injection Mapping

Remember that if you've mapped a class using mapSingletonOf then you must inject using the *first* parameter and not the concrete class.

<pre>
injector.mapSingletonOf(ISomeType, SomeType);
injector.mapSingletonOf(BaseSomeType, SpecialSomeType);
</pre>

So, these injections will be fine:

<pre>
[Inject]
public var someValue:ISomeType;

[Inject]
public var someOtherValue:BaseSomeType;
</pre>

But these injections will produce an injection error:

<pre>
[Inject]
public var someValue:SomeType;

[Inject]
public var someOtherValue:SpecialSomeType;
</pre>