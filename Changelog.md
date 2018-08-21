## Changelog

### Version 0.5.0 (21.08.2018) Work in progress

- ADDED: Support to push the same module multiple times inside the same workflow using the new methods defined below:

```objc
// Create a new module and pass a workflow key used to dequeue the module later
- (HEROBaseCoordinator*)newCoordinatorForRouter:(Class)routerClass coordinator:(Class)coordinatorClass usecase:(Class)usecaseClass workflowKey:(NSString*)workflowKey;

// Dequeue an existing module for a given workflow key
- (HEROBaseCoordinator*)dequeueCoordinatorForRouter:(Class)routerClass coordinator:(Class)coordinatorClass usecase:(Class)usecaseClass workflowKey:(NSString*)workflowKey;
```

- ADDED: Changelog
