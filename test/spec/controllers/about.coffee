describe 'Controller: AboutCtrl', ->
  AboutCtrl = scope =  null

  # Initialize the controller and scope
  beforeEach ->
    # Load the controller's module
    module 'hipster'

    inject ($controller, $rootScope, $location) ->
      scope = $rootScope.$new()
      AboutCtrl = $controller 'AboutCtrl',
        $scope: scope

  it 'should exist', ->
    expect(!!AboutCtrl).toBe yes

  it 'should scope.content', ->
    expect(scope.content).toBeDefined