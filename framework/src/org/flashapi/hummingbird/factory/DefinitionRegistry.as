/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013 Pascal ECHEMANN. All rights reserved.
//    
//    Redistribution and use in source and binary forms, with or without modification,
//    are permitted provided that the following conditions are met:
//    
//    1. Redistributions of source code must retain the above copyright notice, this
//       list of conditions and the following disclaimer. 
//    
//    2. Redistributions in binary form must reproduce the above copyright notice,
//       this list of conditions and the following disclaimer in the documentation
//       and/or other materials provided with the distribution. 
//    
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//    
//    The views and conclusions contained in the software and documentation are those
//    of the authors and should not be interpreted as representing official policies, 
//    either expressed or implied, of the copyright holders.
//    
/////////////////////////////////////////////////////////////////////////////////////

package org.flashapi.hummingbird.factory {
	
	// -----------------------------------------------------------
	//  DefinitionRegistry.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 04/05/2013 18:23
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.controller.IController;
	import org.flashapi.hummingbird.core.IMVCObject;
	import org.flashapi.hummingbird.model.IModel;
	
	/**
	 * 	Default implementation of the <code>IDefinitionRegistry</code> interface:
	 * a full-fledged MVC objects factory based on MVC definition objects.
	 * 
	 * 	<p>Typical usage is registering all MVC objects definitions first, before
	 * 	accessing them. MVC object definition lookup is therefore an inexpensive
	 * 	operation in a local MVC object definition table, operating on pre-built
	 * 	MVC object definition metadata objects.</p>
	 */
	public class DefinitionRegistry implements IDefinitionRegistry {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>DefinitionRegistry</code> instance 
		 * 					with the specified parameter.
		 *
		 * 	@param	iocRef	The class reference of the <code>IHummingbirdContainer</code>
		 * 					which is associated with this <code>DefinitionRegistry</code>
		 * 					instance.
		 */
		public function DefinitionRegistry(iocRef:Class) {
			super();
			this.initObj(iocRef);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function getModel(alias:String):IModel {
			return _iocRef.getInstance().getMVCObject(alias);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getController(alias:String):IController {
			return _iocRef.getInstance().getMVCObject(alias);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function removeDefinition(alias:String):IMVCObject {
			return _iocRef.getInstance().removeMVCObject(alias);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 *  The reference to the <code>IHummingbirdContainer</code> which is associated
		 * 	with this <code>DefinitionRegistry</code> instance.
		 */
		private var _iocRef:Object;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes the definition registry object.
		 * 
		 * 	@param	iocRef	The class reference of the <code>IHummingbirdContainer</code>
		 * 					which is associated with this <code>DefinitionRegistry</code>
		 * 					instance.
		 */
		private function initObj(iocRef:Class):void {
			_iocRef = iocRef;
		}
	}
}