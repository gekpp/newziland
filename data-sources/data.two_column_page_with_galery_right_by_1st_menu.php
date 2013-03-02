<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcetwo_column_page_with_galery_right_by_1st_menu extends Datasource{

		public $dsParamROOTELEMENT = 'two-column-page-with-galery-right-by-1st-menu';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'galery';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'73' => '{$ds-active-1st-menu:zzzzz}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'human-name',
				'title',
				'galery: entries',
				'description',
				'left-column',
				'right-column'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-active-1st-menu');
		}

		public function about(){
			return array(
				'name' => 'two column page with galery right by 1st menu',
				'author' => array(
					'name' => 'Arkadiy Romanov',
					'website' => 'http://newziland-ru.1gb.ru',
					'email' => 'arkadyrom@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2013-03-02T22:27:48+00:00'
			);
		}

		public function getSource(){
			return '11';
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
