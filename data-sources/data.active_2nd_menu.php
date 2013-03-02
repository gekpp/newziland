<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceactive_2nd_menu extends Datasource{

		public $dsParamROOTELEMENT = 'active-2nd-menu';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'69' => '{$nd-menu}',
				'27' => '{$ds-active-1st-menu}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'page-content: count',
				'page-content: items',
				'page-content: entries'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-active-1st-menu');
		}

		public function about(){
			return array(
				'name' => 'active 2nd menu',
				'author' => array(
					'name' => 'Arkadiy Romanov',
					'website' => 'http://newziland-ru.1gb.ru',
					'email' => 'arkadyrom@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2013-02-28T09:17:54+00:00'
			);
		}

		public function getSource(){
			return '8';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
