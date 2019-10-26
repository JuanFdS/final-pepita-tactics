class Initialization {
	const init
	const onRefresh = { }
	
	method run(initializableObject) {
		init.apply()
		initializableObject.init(new Initialized(onRefresh=onRefresh))
	}
	
}

class Initialized {
	const onRefresh
	method run(initializedObject) {
		onRefresh.apply()
	}
}
