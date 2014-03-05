describe 'Service: firebaseFactory', ->
  firebaseFactory = null

  beforeEach ->
    # Load the service's module
    module 'hipster'

    # Provide any mocks needed
    module ($provide) ->
      #$provide.value 'Name', new MockName()
      # Make sure CoffeeScript doesn't return anything
      null

    # Inject in angular constructs otherwise,
    #  you would need to inject these into each test
    inject (_firebaseFactory_) ->
      firebaseFactory = _firebaseFactory_

  it 'should exist', ->
    expect(!!firebaseFactory).toBe yes

  describe 'the service api', ->
    it 'should return an array', ->
      expect(firebaseFactory('posts') instanceof Object).toBe true