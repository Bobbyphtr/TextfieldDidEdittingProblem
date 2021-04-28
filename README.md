# TextfieldDidEdittingProblem
https://stackoverflow.com/questions/67263289/uitextfield-editingdidbegin-triggered-twice-on-ios-14-4?noredirect=1#comment118925613_67263289

So to recreate the problem, please run the project. And try to fill both of the textfields. You will notice that the bottomsheets and the datapicker will be triggered twice.

This project uses RxSwift with Coordinator Pattern. It basically a rip off of my main project. So pardon for a bit complicated code with containers.

The concept is not that hard.

A Transaction Container, contains a Service. So the TransactionCoordinator will choose what kind of sub service that you want to choose (in this case PPOB) and will start the PPOB Coordinator that will fill the container with desired service.

Feel free to contact me trough StackOverflow if you need more explanation.
https://stackoverflow.com/questions/67263289/uitextfield-editingdidbegin-triggered-twice-on-ios-14-4?noredirect=1#comment118925613_67263289
