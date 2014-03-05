describe 'Controller: NavCtrl', ->
  NavCtrl = scope =  null

  # Initialize the controller and scope
  beforeEach ->
    # Load the controller's module
    module 'hipster'

    inject ($controller, $rootScope) ->
      scope = $rootScope.$new()
      NavCtrl = $controller 'NavCtrl',
        $scope: scope

  it 'should exist', ->
    expect(!!NavCtrl).toBe yes

  it 'should have active function defined', ->
    expect(scope.active).toBeDefined