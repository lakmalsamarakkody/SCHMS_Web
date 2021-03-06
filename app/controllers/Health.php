<?php

use Carbon\Carbon;
use Illuminate\Database\Capsule\Manager as DB;

class Health extends Controller {
    public function index() {

        //CHECK LOGIN STATUS
		if( !isset($_SESSION['user']) OR $_SESSION['user']['is_login'] != true ):
			header( 'Location:' . $this->config->get('base_url') . '/logout' );
			exit();
		endif;
    
        // SITE DETAILS
		$data['app']['url']			= $this->config->get('base_url');
		$data['app']['title']		= $this->config->get('site_title');
		$data['app']['theme']		= $this->config->get('app_theme');

		// HEADER / FOOTER
		$data['template']['header']		= $this->load->controller('common/header', $data);
        $data['template']['footer']		= $this->load->controller('common/footer', $data);
        $data['template']['sidenav']	= $this->load->controller('common/sidenav', $data);
        $data['template']['topmenu']	= $this->load->controller('common/topmenu', $data);

        // MODEL
        $this->load->model('student');
        $this->load->model('student/health');
        $this->load->model('class');
        $this->load->model('grade');
        $this->load->model('user');

        // CHECK PERMISSION : index
        if ( $this->model_user->find($_SESSION['user']['id'])->hasPermission('health-index-view') ):
            $data['permission']['health']['index']['view'] = true;
        else:
            $data['permission']['health']['index']['view'] = false;
        endif;
        
        // STUDENT TOTAL CARD
		$data['student']['total']['all'] = $this->model_student->select('id')->count();
		$data['student']['total']['male'] = $this->model_student->select('id')->where('gender', '=', 'male')->count();
        $data['student']['total']['female'] = $this->model_student->select('id')->where('gender', '=', 'female')->count();
        
        // STUDENT AVERAGE BMI CARD
        $data['student']['average']['bmi']['all'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
		->where('student_health.bmi', '>=', '18.5')->where('student_health.bmi', '<=', '25')
        ->count();

        $data['student']['average']['bmi']['male'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
        ->where('student_health.bmi', '>=', '18.5')->where('student_health.bmi', '<=', '25')
        ->where('student.gender', '=', 'male')
        ->count();

        $data['student']['average']['bmi']['female'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
        ->where('student_health.bmi', '>=', '18.5')->where('student_health.bmi', '<=', '25')
        ->where('student.gender', '=', 'female')
        ->count();

        // STUDENT ABOVE AVERAGE BMI CARD
        $data['student']['above']['bmi']['all'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
		->where('student_health.bmi', '>', '25')
        ->count();

        $data['student']['above']['bmi']['male'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
        ->where('student_health.bmi', '>', '25')
        ->where('student.gender', '=', 'male')
        ->count();

        $data['student']['above']['bmi']['female'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
        ->where('student_health.bmi', '>', '25')
        ->where('student.gender', '=', 'female')
        ->count();

        // STUDENT BELOW AVERAGE BMI CARD
        $data['student']['below']['bmi']['all'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
		->where('student_health.bmi', '<', '18.5')
        ->count();

        $data['student']['below']['bmi']['male'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
        ->where('student_health.bmi', '<', '18.5')
        ->where('student.gender', '=', 'male')
        ->count();

        $data['student']['below']['bmi']['female'] = DB::table('student_health')
		->join('student', 'student_health.student_id', '=', 'student.id')
		->select('student.id')
        ->where('student_health.bmi', '<', '18.5')
        ->where('student.gender', '=', 'female')
        ->count();

        // APEX CHARTS
        // BMI LIST BY CLASS
        foreach ( $this->model_class->select('id','grade_id','name')->get() as $key => $element ):

            $grade = $this->model_grade->select('name')->where('id', '=', $element->grade_id)->first()->name;
            $data['classes'][$key]['name'] = $grade." - ".$element->name;

            // BELOW
            $data['belowbmis'][$key]['all'] = DB::table('student_health')
            ->join('student', 'student_health.student_id', '=', 'student.id')
            ->select('student.id')
            ->where('class_id', '=', $element->id)
            ->where('student_health.bmi', '<', '18.5')
            ->count();

            // AVERAGE
            $data['averagebmis'][$key]['all'] = DB::table('student_health')
            ->join('student', 'student_health.student_id', '=', 'student.id')
            ->select('student.id')
            ->where('class_id', '=', $element->id)
            ->where('student_health.bmi', '>=', '18.5')->where('student_health.bmi', '<=', '25')
            ->count();

            // ABOVE
            $data['abovebmis'][$key]['all'] = DB::table('student_health')
            ->join('student', 'student_health.student_id', '=', 'student.id')
            ->select('student.id')
            ->where('class_id', '=', $element->id)
            ->where('student_health.bmi', '>', '25')
            ->count();
            
        endforeach;

        // BMI OVERALL PIE CHART
        $data['overall_below_bmi'] = $this->model_student_health->select('id')->where('student_health.bmi', '<', '18.5')->count();
        $data['overall_average_bmi'] = $this->model_student_health->select('id')->where('student_health.bmi', '>=', '18.5')->where('student_health.bmi', '<=', '25')->count();
        $data['overall_above_bmi'] = $this->model_student_health->select('id')->where('student_health.bmi', '>', '25')->count();

		// RENDER VIEW
        $this->load->view('health/index', $data);
    }

    public function search() {

        //CHECK LOGIN STATUS
		if( !isset($_SESSION['user']) OR $_SESSION['user']['is_login'] != true ):
			header( 'Location:' . $this->config->get('base_url') . '/logout' );
			exit();
		endif;
    
        // SITE DETAILS
		$data['app']['url']			= $this->config->get('base_url');
		$data['app']['title']		= $this->config->get('site_title');
		$data['app']['theme']		= $this->config->get('app_theme');

		// HEADER / FOOTER
		$data['template']['header']		= $this->load->controller('common/header', $data);
        $data['template']['footer']		= $this->load->controller('common/footer', $data);
        $data['template']['sidenav']	= $this->load->controller('common/sidenav', $data);
        $data['template']['topmenu']	= $this->load->controller('common/topmenu', $data);

        // MODEL
        $this->load->model('class');
        $this->load->model('grade');
        $this->load->model('sport');
        $this->load->model('student');
        $this->load->model('student/sport');
        $this->load->model('student/health');
        $this->load->model('user');

        // CHECK PERMISSION : search
        if ( $this->model_user->find($_SESSION['user']['id'])->hasPermission('health-search-view') ):
            $data['permission']['health']['search']['view'] = true;
        else:
            $data['permission']['health']['search']['view'] = false;
        endif;

        // CHECK PERMISSION : student-profile
        if ( $this->model_user->find($_SESSION['user']['id'])->hasPermission('student-profile-view') ):
            $data['permission']['student']['profile']['view'] = true;
        else:
            $data['permission']['student']['profile']['view'] = false;
        endif;

        // CHECK PERMISSION : edit
        if ( $this->model_user->find($_SESSION['user']['id'])->hasPermission('health-search-edit') ):
            $data['permission']['health']['search']['edit'] = true;
        else:
            $data['permission']['health']['search']['edit'] = false;
        endif;

        // CHECK PERMISSION : delete
        if ( $this->model_user->find($_SESSION['user']['id'])->hasPermission('health-search-delete') ):
            $data['permission']['health']['search']['delete'] = true;
        else:
            $data['permission']['health']['search']['delete'] = false;
        endif;

        //STUDENT CLASS
        foreach( $this->model_class->select('id', 'grade_id', 'staff_id', 'name')->get() as $key => $element ):
            $data['student_class'][$key]['id'] = $element->id;
            $data['student_class'][$key]['grade']['id'] = $element->grade_id;
            $data['student_class'][$key]['staff']['id'] = $element->staff_id;
            $data['student_class'][$key]['name'] = $element->name;

            $data['student_class'][$key]['grade']['name'] = $this->model_grade->select('name')->where('id', '=', $element->grade_id)->first()->name;
        endforeach;

        //GRADE
        foreach( $this->model_grade->select('id', 'name')->orderBy('name')->get() as $key => $element ):
            $data['student_grade'][$key]['id'] = $element->id;
            $data['student_grade'][$key]['name'] = $element->name;
        endforeach;

        // SPORT
		foreach( $this->model_sport->select('id', 'name')->orderBy('id')->get() as $key => $element ):
			$data['sports'][$key]['id'] = $element->id;
			$data['sports'][$key]['name']= $element->name;
        endforeach;

        // BLOOD GROUPS
        $data['blood']['types'][2]['name'] = 'A+';
        $data['blood']['types'][1]['name'] = 'A-';
        $data['blood']['types'][4]['name'] = 'B+';
        $data['blood']['types'][3]['name'] = 'B-';
        $data['blood']['types'][6]['name'] = 'AB+';
        $data['blood']['types'][5]['name'] = 'AB-';
        $data['blood']['types'][8]['name'] = 'O+';
        $data['blood']['types'][7]['name'] = 'O-';

        // SEARCH STUDENT
        if( isset( $this->request->post['isSubmitedStudent']) ):
            
            // PERSIST DATA
            $data['form']['field']['student_name'] = ( isset($this->request->post['student_name']) AND !empty($this->request->post['student_name']) ) ? $this->request->post['student_name'] : "";
            $data['form']['field']['student_class'] = ( isset($this->request->post['student_class']) AND !empty($this->request->post['student_class']) ) ? $this->request->post['student_class'] : "";
            $data['form']['field']['student_grade'] = ( isset($this->request->post['student_grade']) AND !empty($this->request->post['student_grade']) ) ? $this->request->post['student_grade'] : "";
            $data['form']['field']['student_gender'] = ( isset($this->request->post['student_gender']) AND !empty($this->request->post['student_gender']) ) ? $this->request->post['student_gender'] : "";
            $data['form']['field']['student_sport'] = ( isset($this->request->post['student_sport']) AND !empty($this->request->post['student_sport']) ) ? $this->request->post['student_sport'] : "";
            $data['form']['field']['student_min_height'] = ( isset($this->request->post['student_min_height']) AND !empty($this->request->post['student_min_height']) ) ? $this->request->post['student_min_height'] : "";
            $data['form']['field']['student_max_height'] = ( isset($this->request->post['student_max_height']) AND !empty($this->request->post['student_max_height']) ) ? $this->request->post['student_max_height'] : "";
            $data['form']['field']['student_min_weight'] = ( isset($this->request->post['student_min_weight']) AND !empty($this->request->post['student_min_weight']) ) ? $this->request->post['student_min_weight'] : "";
            $data['form']['field']['student_max_weight'] = ( isset($this->request->post['student_max_weight']) AND !empty($this->request->post['student_max_weight']) ) ? $this->request->post['student_max_weight'] : "";
            $data['form']['field']['student_bmi'] = ( isset($this->request->post['student_bmi']) AND !empty($this->request->post['student_bmi']) ) ? $this->request->post['student_bmi'] : "";
            $data['form']['field']['student_blood_group'] = ( isset($this->request->post['student_blood_group']) AND !empty($this->request->post['student_blood_group']) ) ? $this->request->post['student_blood_group'] : "";

            // Eloquent OBJECT
            $student = $this->model_student->select('id', 'admission_no', 'admission_date', 'class_id', 'full_name', 'initials', 'surname', 'dob', 'gender', 'email', 'phone_mobile', 'address', 'city', 'district_id', 'religion_id');

            // FILTER ( NAME )
            if ( isset($this->request->post['student_name']) AND !empty($this->request->post['student_name']) ):
                $student->where(function($query) {
                    $query->where('full_name', 'LIKE', '%'.$this->request->post['student_name'].'%');
                });
            endif;

            // FILTER ( CLASS )
            if ( isset($this->request->post['student_class']) AND !empty($this->request->post['student_class']) ):
                $student->where(function($query) {
                    $query->where('class_id', '=', $this->request->post['student_class']);
                });
            endif;

            // FILTER ( GRADE )
            if ( isset($this->request->post['student_grade']) AND !empty($this->request->post['student_grade']) ):
                $class = $this->model_class->select('id')->where('grade_id', '=', $this->request->post['student_grade'])->get();
                if ( $class != NULL ):
                    $classes = array();
                    foreach ( $class as $key => $element ):
                        array_push($classes, $element->id);
                    endforeach;
                    $student->where(function($query) use ($classes) {
                        $query->whereIn('class_id', $classes);
                    });
                endif; 
            endif;

            // FILTER ( GENDER )
            if ( isset($this->request->post['student_gender']) AND !empty($this->request->post['student_gender']) ):
                $student->where(function($query) {
                    $query->where('gender', '=', $this->request->post['student_gender']);
                });
            endif;

            // FILTER (SPORT)
            if ( isset($this->request->post['student_sport']) AND !empty($this->request->post['student_sport']) ):
                $student_sport = $this->model_student_sport->select('student_id')->whereIn('sport_id', $this->request->post['student_sport'])->get();
                $student_ids = array();
                foreach( $student_sport as $el ):
                    array_push($student_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($student_ids) {
                    $query->whereIn('id', $student_ids);
                });
            endif;

            // FILTER (HEIGHT_MIN)
            if ( isset($this->request->post['student_min_height']) AND !empty($this->request->post['student_min_height']) ):
                $student_min_height = $this->model_student_health->select('student_id')->where('height', '>=', $this->request->post['student_min_height'])->get();
                $health_height_min_ids = array();
                foreach( $student_min_height as $el ):
                    array_push($health_height_min_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_height_min_ids) {
                    $query->whereIn('id', $health_height_min_ids);
                });
            endif;
            // FILTER (HEIGHT_MAX)
            if ( isset($this->request->post['student_max_height']) AND !empty($this->request->post['student_max_height']) ):
                $student_max_height = $this->model_student_health->select('student_id')->where('height', '<=', $this->request->post['student_max_height'])->get();
                $health_height_max_ids = array();
                foreach( $student_max_height as $el ):
                    array_push($health_height_max_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_height_max_ids) {
                    $query->whereIn('id', $health_height_max_ids);
                });
            endif;

            // FILTER (WEIGHT_MIN)
            if ( isset($this->request->post['student_min_weight']) AND !empty($this->request->post['student_min_weight']) ):
                $student_min_weight = $this->model_student_health->select('student_id')->where('weight', '>=', $this->request->post['student_min_weight'])->get();
                $health_weight_min_ids = array();
                foreach( $student_min_weight as $el ):
                    array_push($health_weight_min_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_weight_min_ids) {
                    $query->whereIn('id', $health_weight_min_ids);
                });
            endif;
            // FILTER (WEIGHT_MAX)
            if ( isset($this->request->post['student_max_weight']) AND !empty($this->request->post['student_max_weight']) ):
                $student_max_weight = $this->model_student_health->select('student_id')->where('weight', '<=', $this->request->post['student_max_weight'])->get();
                $health_weight_max_ids = array();
                foreach( $student_max_weight as $el ):
                    array_push($health_weight_max_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_weight_max_ids) {
                    $query->whereIn('id', $health_weight_max_ids);
                });
            endif;

            // FILTER (BMI)
            if ( isset($this->request->post['student_bmi']) AND !empty($this->request->post['student_bmi']) ):
                if ( $this->request->post['student_bmi'] == "below-average" ):
                    $student_bmi = $this->model_student_health->select('student_id')->where('bmi', '<', 18.5)->get();
                elseif ( $this->request->post['student_bmi'] == "in-average" ):
                    $student_bmi = $this->model_student_health->select('student_id')->where('bmi', '>=', 18.5)->where('bmi', '<=', 25)->get();
                else:
                    $student_bmi = $this->model_student_health->select('student_id')->where('bmi', '>', 25)->get();
                endif;
                
                $student_bmi_ids = array();
                foreach( $student_bmi as $el ):
                    array_push($student_bmi_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($student_bmi_ids) {
                    $query->whereIn('id', $student_bmi_ids);
                });
            endif;

            // FILTER (BLOOD GROUP)
            if ( isset($this->request->post['student_blood_group']) AND !empty($this->request->post['student_blood_group']) ):
                $student_blood_group = $this->model_student_health->select('student_id')->where('blood_group', '=', $this->request->post['student_blood_group'])->get();
                $student_blood_group_ids = array();
                foreach( $student_blood_group as $el ):
                    array_push($student_blood_group_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($student_blood_group_ids) {
                    $query->whereIn('id', $student_blood_group_ids);
                });
            endif;

            // APPEND DATA TO ARRAY
            foreach( $student->get() as $key => $value ):
                
                $data['students'][$key]['id'] = $value->id;
                $data['students'][$key]['admission_no'] = $value->admission_no;
                $data['students'][$key]['name'] = $value->initials." ".$value->surname;
                $data['students'][$key]['gender'] = $value->gender;
                $data['students'][$key]['dob'] = $value->dob;
                $data['students'][$key]['class'] = $value->class_id;
                $data['students'][$key]['city'] = $value->city;

                $health_data = $this->model_student_health->where('student_id', '=', $value->id)->first();
                if ( $health_data !== NULL):
                    $data['students'][$key]['health_id'] = $health_data->id;
                    $data['students'][$key]['height'] = $health_data->height;
                    $data['students'][$key]['weight'] = $health_data->weight;
                    $data['students'][$key]['bmi'] = $health_data->bmi;
                    $data['students'][$key]['hr'] = $health_data->heart_rate;
                    $data['students'][$key]['bp'] = $health_data->blood_pressure;
                    $data['students'][$key]['bg'] = $health_data->blood_group;
                    $data['students'][$key]['speciality'] = $health_data->speciality;
                    $data['students'][$key]['vaccination'] = $health_data->vaccination;
                    $data['students'][$key]['date'] = $health_data->date;
                endif;

            endforeach;

        endif;

		// RENDER VIEW
        $this->load->view('health/search', $data);
    }

    public function ajax_edit_health() {

        //CHECK LOGIN STATUS
        if( !isset($_SESSION['user']) OR $_SESSION['user']['is_login'] != true ):
            header( 'Location:' . $this->config->get('base_url') . '/logout' );
            exit();
        endif;

        // SET JSON HEADER
        header('Content-Type: application/json');

        // MODEL
        $this->load->model('student/health');
        $this->load->model('notification');
        $this->load->model('user');

        // PERMISSION
        if ( !$this->model_user->find($_SESSION['user']['id'])->hasPermission('health-search-edit') ):
            echo json_encode( array( "status" => "failed", "message" => "Permission denied" ), JSON_PRETTY_PRINT );
            exit();
        endif;

        $time_now = Carbon::now()->format('Y-m-d h:i:s A');
        $date_now = Carbon::now()->isoFormat('YYYY-MM-DD');

        // VALIDATION : height
        $is_valid_height = GUMP::is_valid($this->request->post, array('height' => 'numeric|max_len,3'));
        if ( $is_valid_height !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid height" ), JSON_PRETTY_PRINT );
            exit();
        endif;
        
        // VALIDATION : weight
        $is_valid_weight = GUMP::is_valid($this->request->post, array('weight' => 'numeric|max_len,3'));
        if ( $is_valid_weight !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid weight" ), JSON_PRETTY_PRINT );
            exit();
        endif;
        
        // VALIDATION : heart_rate
        $is_valid_heart_rate = GUMP::is_valid($this->request->post, array('heart_rate' => 'numeric|max_len,3'));
        if ( $is_valid_heart_rate !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid heart rate" ), JSON_PRETTY_PRINT );
            exit();
        endif;
        
        // VALIDATION : blood_pressure
        $is_valid_blood_pressure = GUMP::is_valid($this->request->post, array('blood_pressure' => 'numeric|max_len,3'));
        if ( $is_valid_blood_pressure !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid blood pressure" ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : speciaity
        $is_valid_speciaity = GUMP::is_valid($this->request->post, array('speciaity' => 'valid_name'));
        if ( $is_valid_speciaity !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid speciaity" ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : vaccination
        $is_valid_vaccination = GUMP::is_valid($this->request->post, array('vaccination' => 'valid_name'));
        if ( $is_valid_vaccination !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid vaccination" ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // CALCULATE BMI
        if ( !empty($this->request->post['height']) AND !empty($this->request->post['weight']) ):
            $bmi = round((int)$this->request->post['weight'] / (((int)$this->request->post['height']/100) * ((int)$this->request->post['height']/100)),2);
        else:
            $bmi = NULL;
        endif;

        // IS EXIST HEALTH RECORD
        $is_exists_health_id = $this->model_student_health->where('student_id', '=', $this->request->post['id'])->first();
        if ( $is_exists_health_id !== NULL ):

            // UPDATE CURRENT RECORD
            try {
                $this->model_student_health->where('student_id', '=', $this->request->post['id'])->update([
                    'height' => empty($this->request->post['height']) ? NULL : $this->request->post['height'],
                    'weight' => empty($this->request->post['weight']) ? NULL : $this->request->post['weight'],
                    'bmi' => $bmi,
                    'heart_rate' => empty($this->request->post['heart_rate']) ? NULL : $this->request->post['heart_rate'],
                    'blood_pressure' => empty($this->request->post['blood_pressure']) ? NULL : $this->request->post['blood_pressure'],
                    'blood_group' => empty($this->request->post['blood_group']) ? NULL : $this->request->post['blood_group'],
                    'speciality' => empty($this->request->post['speciality']) ? NULL : $this->request->post['speciality'],
                    'vaccination' => empty($this->request->post['vaccination']) ? NULL : $this->request->post['vaccination'],
                    'date' => empty($this->request->post['date']) ? $date_now : $this->request->post['date'],
                ]);

                // CHECK AVAILABLE USER
                $available_user = $this->model_user->select('id')->where('ref_id', '=', $this->request->post['id'])->where('user_type', '=', 'student')->first();
                if ( $available_user != NULL ):
                    // INITIATE : NOTIFICATION
                    $this->model_notification->sender_id = $_SESSION['user']['id'];
                    $this->model_notification->receiver_id = $available_user->id;
                    $this->model_notification->title = "Health Record Updated";
                    $this->model_notification->body = "Your health details has been updated";
                    $this->model_notification->save();
                endif;

                echo json_encode( array("status" => "success"), JSON_PRETTY_PRINT );
                exit();

            } catch (\Illuminate\Database\QueryException $e) {
                echo json_encode( array( "status" => "failed", "message" => "Record Modification failed." ), JSON_PRETTY_PRINT );
                exit();
            }
        else:
            // CREATE NEW RECORD
            $this->model_student_health->student_id = $this->request->post['id'];
            $this->model_student_health->height = empty($this->request->post['height']) ? NULL : $this->request->post['height'];
            $this->model_student_health->weight = empty($this->request->post['weight']) ? NULL : $this->request->post['weight'];
            $this->model_student_health->bmi = $bmi;
            $this->model_student_health->heart_rate = empty($this->request->post['heart_rate']) ? NULL :$this->request->post['heart_rate'];
            $this->model_student_health->blood_pressure = empty($this->request->post['blood_pressure']) ? NULL : $this->request->post['blood_pressure'];
            $this->model_student_health->blood_group = empty($this->request->post['blood_group']) ? NULL : $this->request->post['blood_group'];
            $this->model_student_health->speciality = empty($this->request->post['speciality']) ? NULL : $this->request->post['speciality'];
            $this->model_student_health->vaccination = empty($this->request->post['vaccination']) ? NULL : $this->request->post['vaccination'];
            $this->model_student_health->date = empty($this->request->post['date']) ? $date_now : $this->request->post['date'];
            
            // SUBMIT
            if ( $this->model_student_health->save() ):

                // CHECK AVAILABLE USER
                $available_user = $this->model_user->select('id')->where('ref_id', '=', $this->request->post['id'])->where('user_type', '=', 'student')->first();
                if ( $available_user != NULL ):
                    // INITIATE : NOTIFICATION
                    $this->model_notification->sender_id = $_SESSION['user']['id'];
                    $this->model_notification->receiver_id = $available_user->id;
                    $this->model_notification->title = "New Health Record Added";
                    $this->model_notification->body = "Your health details has been added to the system";
                    $this->model_notification->save();
                endif;

                echo json_encode( array( "status" => "success" ), JSON_PRETTY_PRINT );
                exit();
            else:
                echo json_encode( array( "status" => "failed", "message" => "Record Didn't Saved Successfully" ), JSON_PRETTY_PRINT );
                exit();
            endif;
        endif;

    }

    public function ajax_removehealth() {

		//CHECK LOGIN STATUS
		if( !isset($_SESSION['user']) OR $_SESSION['user']['is_login'] != true ):
			header( 'Location:' . $this->config->get('base_url') . '/logout' );
			exit();
		endif;

		// SET JSON HEADER
		header('Content-Type: application/json');

		// MODEL
        $this->load->model('student/health');
        $this->load->model('user');
        
        // PERMISSION
        if ( !$this->model_user->find($_SESSION['user']['id'])->hasPermission('health-search-delete') ):
            echo json_encode( array( "status" => "failed", "message" => "Permission denied" ), JSON_PRETTY_PRINT );
            exit();
        endif;
		
        if ( isset($this->request->post['health_id']) AND !empty($this->request->post['health_id']) ):
            $is_valid_health_id = $this->model_student_health->select('id')->where('id', '=', $this->request->post['health_id']);

			if ( $is_valid_health_id->first() !== NULL ):
				if ( $this->model_student_health->find($this->request->post['health_id'])->delete() ):
					echo json_encode( array( "status" => "success" ), JSON_PRETTY_PRINT );
					exit();
				else:
					echo json_encode( array( "status" => "failed", "message" => "Cannot delete this health record. Please contact system administrator" ), JSON_PRETTY_PRINT );
                    exit();
				endif;
			else:
				echo json_encode( array( "status" => "failed", "message" => "No record found" ), JSON_PRETTY_PRINT );
				exit();
			endif;
		else:
			echo json_encode( array( "status" => "failed", "message" => "This student doesn't have a health record" ), JSON_PRETTY_PRINT );
			exit();
		endif;
    }

    public function add() {

        //CHECK LOGIN STATUS
		if( !isset($_SESSION['user']) OR $_SESSION['user']['is_login'] != true ):
			header( 'Location:' . $this->config->get('base_url') . '/logout' );
			exit();
		endif;
    
        // SITE DETAILS
		$data['app']['url']			= $this->config->get('base_url');
		$data['app']['title']		= $this->config->get('site_title');
		$data['app']['theme']		= $this->config->get('app_theme');

		// HEADER / FOOTER
		$data['template']['header']		= $this->load->controller('common/header', $data);
        $data['template']['footer']		= $this->load->controller('common/footer', $data);
        $data['template']['sidenav']	= $this->load->controller('common/sidenav', $data);
        $data['template']['topmenu']	= $this->load->controller('common/topmenu', $data);

        // MODEL
        $this->load->model('class');
        $this->load->model('grade');
        $this->load->model('sport');
        $this->load->model('student');
        $this->load->model('student/sport');
        $this->load->model('student/health');
        $this->load->model('user');

        // CHECK PERMISSION : add
        if ( $this->model_user->find($_SESSION['user']['id'])->hasPermission('health-add-view') ):
            $data['permission']['health']['add']['view'] = true;
        else:
            $data['permission']['health']['add']['view'] = false;
        endif;

        //STUDENT CLASS
        foreach( $this->model_class->select('id', 'grade_id', 'staff_id', 'name')->get() as $key => $element ):
            $data['student_class'][$key]['id'] = $element->id;
            $data['student_class'][$key]['grade']['id'] = $element->grade_id;
            $data['student_class'][$key]['staff']['id'] = $element->staff_id;
            $data['student_class'][$key]['name'] = $element->name;

            $data['student_class'][$key]['grade']['name'] = $this->model_grade->select('name')->where('id', '=', $element->grade_id)->first()->name;
        endforeach;

        //GRADE
        foreach( $this->model_grade->select('id', 'name')->orderBy('name')->get() as $key => $element ):
            $data['student_grade'][$key]['id'] = $element->id;
            $data['student_grade'][$key]['name'] = $element->name;
        endforeach;

        // SPORT
		foreach( $this->model_sport->select('id', 'name')->orderBy('id')->get() as $key => $element ):
			$data['sports'][$key]['id'] = $element->id;
			$data['sports'][$key]['name']= $element->name;
        endforeach;

        // BLOOD GROUPS
        $data['blood']['types'][2]['name'] = 'A+';
        $data['blood']['types'][1]['name'] = 'A-';
        $data['blood']['types'][4]['name'] = 'B+';
        $data['blood']['types'][3]['name'] = 'B-';
        $data['blood']['types'][6]['name'] = 'AB+';
        $data['blood']['types'][5]['name'] = 'AB-';
        $data['blood']['types'][8]['name'] = 'O+';
        $data['blood']['types'][7]['name'] = 'O-';

        // SEARCH STUDENT
        if( isset( $this->request->post['isSubmitedStudent']) ):
            
            // PERSIST DATA
            $data['form']['field']['student_name'] = ( isset($this->request->post['student_name']) AND !empty($this->request->post['student_name']) ) ? $this->request->post['student_name'] : "";
            $data['form']['field']['student_class'] = ( isset($this->request->post['student_class']) AND !empty($this->request->post['student_class']) ) ? $this->request->post['student_class'] : "";
            $data['form']['field']['student_grade'] = ( isset($this->request->post['student_grade']) AND !empty($this->request->post['student_grade']) ) ? $this->request->post['student_grade'] : "";
            $data['form']['field']['student_gender'] = ( isset($this->request->post['student_gender']) AND !empty($this->request->post['student_gender']) ) ? $this->request->post['student_gender'] : "";
            $data['form']['field']['student_sport'] = ( isset($this->request->post['student_sport']) AND !empty($this->request->post['student_sport']) ) ? $this->request->post['student_sport'] : "";
            $data['form']['field']['student_min_height'] = ( isset($this->request->post['student_min_height']) AND !empty($this->request->post['student_min_height']) ) ? $this->request->post['student_min_height'] : "";
            $data['form']['field']['student_max_height'] = ( isset($this->request->post['student_max_height']) AND !empty($this->request->post['student_max_height']) ) ? $this->request->post['student_max_height'] : "";
            $data['form']['field']['student_min_weight'] = ( isset($this->request->post['student_min_weight']) AND !empty($this->request->post['student_min_weight']) ) ? $this->request->post['student_min_weight'] : "";
            $data['form']['field']['student_max_weight'] = ( isset($this->request->post['student_max_weight']) AND !empty($this->request->post['student_max_weight']) ) ? $this->request->post['student_max_weight'] : "";
            $data['form']['field']['student_bmi'] = ( isset($this->request->post['student_bmi']) AND !empty($this->request->post['student_bmi']) ) ? $this->request->post['student_bmi'] : "";
            $data['form']['field']['student_blood_group'] = ( isset($this->request->post['student_blood_group']) AND !empty($this->request->post['student_blood_group']) ) ? $this->request->post['student_blood_group'] : "";

            // Eloquent OBJECT
            $student = $this->model_student->select('id', 'admission_no', 'admission_date', 'class_id', 'full_name', 'initials', 'surname', 'dob', 'gender', 'email', 'phone_mobile', 'address', 'city', 'district_id', 'religion_id');

            // FILTER ( NAME )
            if ( isset($this->request->post['student_name']) AND !empty($this->request->post['student_name']) ):
                $student->where(function($query) {
                    $query->where('full_name', 'LIKE', '%'.$this->request->post['student_name'].'%');
                });
            endif;

            // FILTER ( CLASS )
            if ( isset($this->request->post['student_class']) AND !empty($this->request->post['student_class']) ):
                $student->where(function($query) {
                    $query->where('class_id', '=', $this->request->post['student_class']);
                });
            endif;

            // FILTER ( GRADE )
            if ( isset($this->request->post['student_grade']) AND !empty($this->request->post['student_grade']) ):
                $class = $this->model_class->select('id')->where('grade_id', '=', $this->request->post['student_grade'])->get();
                if ( $class != NULL ):
                    $classes = array();
                    foreach ( $class as $key => $element ):
                        array_push($classes, $element->id);
                    endforeach;
                    $student->where(function($query) use ($classes) {
                        $query->whereIn('class_id', $classes);
                    });
                endif; 
            endif;

            // FILTER ( GENDER )
            if ( isset($this->request->post['student_gender']) AND !empty($this->request->post['student_gender']) ):
                $student->where(function($query) {
                    $query->where('gender', '=', $this->request->post['student_gender']);
                });
            endif;

            // FILTER (SPORT)
            if ( isset($this->request->post['student_sport']) AND !empty($this->request->post['student_sport']) ):
                $student_sport = $this->model_student_sport->select('student_id')->whereIn('sport_id', $this->request->post['student_sport'])->get();
                $student_ids = array();
                foreach( $student_sport as $el ):
                    array_push($student_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($student_ids) {
                    $query->whereIn('id', $student_ids);
                });
            endif;

            // FILTER (HEIGHT_MIN)
            if ( isset($this->request->post['student_min_height']) AND !empty($this->request->post['student_min_height']) ):
                $student_min_height = $this->model_student_health->select('student_id')->where('height', '>=', $this->request->post['student_min_height'])->get();
                $health_height_min_ids = array();
                foreach( $student_min_height as $el ):
                    array_push($health_height_min_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_height_min_ids) {
                    $query->whereIn('id', $health_height_min_ids);
                });
            endif;
            // FILTER (HEIGHT_MAX)
            if ( isset($this->request->post['student_max_height']) AND !empty($this->request->post['student_max_height']) ):
                $student_max_height = $this->model_student_health->select('student_id')->where('height', '<=', $this->request->post['student_max_height'])->get();
                $health_height_max_ids = array();
                foreach( $student_max_height as $el ):
                    array_push($health_height_max_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_height_max_ids) {
                    $query->whereIn('id', $health_height_max_ids);
                });
            endif;

            // FILTER (WEIGHT_MIN)
            if ( isset($this->request->post['student_min_weight']) AND !empty($this->request->post['student_min_weight']) ):
                $student_min_weight = $this->model_student_health->select('student_id')->where('weight', '>=', $this->request->post['student_min_weight'])->get();
                $health_weight_min_ids = array();
                foreach( $student_min_weight as $el ):
                    array_push($health_weight_min_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_weight_min_ids) {
                    $query->whereIn('id', $health_weight_min_ids);
                });
            endif;
            // FILTER (WEIGHT_MAX)
            if ( isset($this->request->post['student_max_weight']) AND !empty($this->request->post['student_max_weight']) ):
                $student_max_weight = $this->model_student_health->select('student_id')->where('weight', '<=', $this->request->post['student_max_weight'])->get();
                $health_weight_max_ids = array();
                foreach( $student_max_weight as $el ):
                    array_push($health_weight_max_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($health_weight_max_ids) {
                    $query->whereIn('id', $health_weight_max_ids);
                });
            endif;

            // FILTER (BMI)
            if ( isset($this->request->post['student_bmi']) AND !empty($this->request->post['student_bmi']) ):
                if ( $this->request->post['student_bmi'] == "below-average" ):
                    $student_bmi = $this->model_student_health->select('student_id')->where('bmi', '<', 18.5)->get();
                elseif ( $this->request->post['student_bmi'] == "in-average" ):
                    $student_bmi = $this->model_student_health->select('student_id')->where('bmi', '>=', 18.5)->where('bmi', '<=', 25)->get();
                else:
                    $student_bmi = $this->model_student_health->select('student_id')->where('bmi', '>', 25)->get();
                endif;
                
                $student_bmi_ids = array();
                foreach( $student_bmi as $el ):
                    array_push($student_bmi_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($student_bmi_ids) {
                    $query->whereIn('id', $student_bmi_ids);
                });
            endif;

            // FILTER (BLOOD GROUP)
            if ( isset($this->request->post['student_blood_group']) AND !empty($this->request->post['student_blood_group']) ):
                $student_blood_group = $this->model_student_health->select('student_id')->where('blood_group', '=', $this->request->post['student_blood_group'])->get();
                $student_blood_group_ids = array();
                foreach( $student_blood_group as $el ):
                    array_push($student_blood_group_ids, $el->student_id);
                endforeach;

                $student->where(function($query) use ($student_blood_group_ids) {
                    $query->whereIn('id', $student_blood_group_ids);
                });
            endif;

            // APPEND DATA TO ARRAY
            foreach( $student->get() as $key => $value ):
                $data['students'][$key]['id'] = $value->id;
                $data['students'][$key]['admission_no'] = $value->admission_no;
                $data['students'][$key]['name'] = $value->initials." ".$value->surname;
                $data['students'][$key]['gender'] = $value->gender;
                $data['students'][$key]['dob'] = $value->dob;
                $data['students'][$key]['class'] = $value->class_id;
                $data['students'][$key]['city'] = $value->city;

                // QUERY GET HEALTH DATA
                $student_health = $this->model_student_health->where('student_id', '=', $value->id)->first();
                if ( $student_health !== NULL ):
                // ($student_health->heart_rate) ? $data['students'][$key]['hr'] = $student_health->heart_rate : $data['students'][$key]['hr'] = "" ;
                $data['students'][$key]['hr'] = $student_health->heart_rate;
                $data['students'][$key]['bp'] = $student_health->blood_pressure;
                $data['students'][$key]['height'] = $student_health->height;
                $data['students'][$key]['weight'] = $student_health->weight;
                $data['students'][$key]['bmi'] = $student_health->bmi;
                $data['students'][$key]['vaccination'] = $student_health->vaccination;
                $data['students'][$key]['speciality'] = $student_health->speciality;
                $data['students'][$key]['date'] = $student_health->date;
                $data['students'][$key]['bg'] = $student_health->blood_group;
                $data['students'][$key]['surgeries'] = $student_health->surgeries;
                endif;

            endforeach;

        endif;

		// RENDER VIEW
        $this->load->view('health/add', $data);
    }

    public function ajax_update() {

        //CHECK LOGIN STATUS
		if( !isset($_SESSION['user']) OR $_SESSION['user']['is_login'] != true ):
			header( 'Location:' . $this->config->get('base_url') . '/logout' );
			exit();
		endif;

		// SET JSON HEADER
		header('Content-Type: application/json');

		// MODEL
        $this->load->model('student/health');
        $this->load->model('user');

        // PERMISSION
        if ( !$this->model_user->find($_SESSION['user']['id'])->hasPermission('health-search-edit') ):
            echo json_encode( array( "status" => "failed", "message" => "Permission denied" ), JSON_PRETTY_PRINT );
            exit();
        endif;


        $time_now = Carbon::now()->format('Y-m-d h:i:s A');
        $date_now = Carbon::now()->isoFormat('YYYY-MM-DD');

        // VALIDATION : height
        $is_valid_height = GUMP::is_valid($this->request->post, array('height' => 'numeric|max_len,3'));
        if ( $is_valid_height !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid height" ), JSON_PRETTY_PRINT );
            exit();
        endif;
        
        // VALIDATION : weight
        $is_valid_weight = GUMP::is_valid($this->request->post, array('weight' => 'numeric|max_len,3'));
        if ( $is_valid_weight !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid weight" ), JSON_PRETTY_PRINT );
            exit();
        endif;
        
        // VALIDATION : heart_rate
        $is_valid_heart_rate = GUMP::is_valid($this->request->post, array('heart_rate' => 'numeric|max_len,3'));
        if ( $is_valid_heart_rate !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid heart rate" ), JSON_PRETTY_PRINT );
            exit();
        endif;
        
        // VALIDATION : blood_pressure
        $is_valid_blood_pressure = GUMP::is_valid($this->request->post, array('blood_pressure' => 'numeric|max_len,3'));
        if ( $is_valid_blood_pressure !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid blood pressure" ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : speciaity
        $is_valid_speciaity = GUMP::is_valid($this->request->post, array('speciaity' => 'valid_name'));
        if ( $is_valid_speciaity !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid speciaity" ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : vaccination
        $is_valid_vaccination = GUMP::is_valid($this->request->post, array('vaccination' => 'valid_name'));
        if ( $is_valid_vaccination !== true ):
            echo json_encode( array( "status" => "failed", "message" => "Please enter a valid vaccination" ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // CALCULATE BMI
        if ( !empty($this->request->post['height']) AND !empty($this->request->post['weight']) ):
            $bmi = round((int)$this->request->post['weight'] / (((int)$this->request->post['height']/100) * ((int)$this->request->post['height']/100)),2);
        else:
            $bmi = NULL;
        endif;

        // IS EXIST HEALTH RECORD
        $is_exists_health_id = $this->model_student_health->where('student_id', '=', $this->request->post['id'])->first();
        if ( $is_exists_health_id !== NULL ):

            // UPDATE CURRENT RECORD
            try {
                $this->model_student_health->where('student_id', '=', $this->request->post['id'])->update([
                    'height' => empty($this->request->post['height']) ? NULL : $this->request->post['height'],
                    'weight' => empty($this->request->post['weight']) ? NULL : $this->request->post['weight'],
                    'bmi' => $bmi,
                    'heart_rate' => empty($this->request->post['heart_rate']) ? NULL : $this->request->post['heart_rate'],
                    'blood_pressure' => empty($this->request->post['blood_pressure']) ? NULL : $this->request->post['blood_pressure'],
                    'blood_group' => empty($this->request->post['blood_group']) ? NULL : $this->request->post['blood_group'],
                    'speciality' => empty($this->request->post['speciality']) ? NULL : $this->request->post['speciality'],
                    'vaccination' => empty($this->request->post['vaccination']) ? NULL : $this->request->post['vaccination'],
                    'date' => empty($this->request->post['date']) ? $date_now : $this->request->post['date'],
                ]);

                // CHECK AVAILABLE USER
                $available_user = $this->model_user->select('id')->where('ref_id', '=', $this->request->post['id'])->where('user_type', '=', 'student')->first();
                if ( $available_user != NULL ):
                    // INITIATE : NOTIFICATION
                    $this->model_notification->sender_id = $_SESSION['user']['id'];
                    $this->model_notification->receiver_id = $available_user->id;
                    $this->model_notification->title = "Health Record Updated";
                    $this->model_notification->body = "Your health details has been updated";
                    $this->model_notification->save();
                endif;
                echo json_encode( array("status" => "success"), JSON_PRETTY_PRINT );
                exit();

            } catch (\Illuminate\Database\QueryException $e) {
                echo json_encode( array( "status" => "failed", "message" => "Record Modification failed." ), JSON_PRETTY_PRINT );
                exit();
            }
        else:
            // CREATE NEW RECORD
            $this->model_student_health->student_id = $this->request->post['id'];
            $this->model_student_health->height = empty($this->request->post['height']) ? NULL : $this->request->post['height'];
            $this->model_student_health->weight = empty($this->request->post['weight']) ? NULL : $this->request->post['weight'];
            $this->model_student_health->bmi = $bmi;
            $this->model_student_health->heart_rate = empty($this->request->post['heart_rate']) ? NULL :$this->request->post['heart_rate'];
            $this->model_student_health->blood_pressure = empty($this->request->post['blood_pressure']) ? NULL : $this->request->post['blood_pressure'];
            $this->model_student_health->blood_group = empty($this->request->post['blood_group']) ? NULL : $this->request->post['blood_group'];
            $this->model_student_health->speciality = empty($this->request->post['speciality']) ? NULL : $this->request->post['speciality'];
            $this->model_student_health->vaccination = empty($this->request->post['vaccination']) ? NULL : $this->request->post['vaccination'];
            $this->model_student_health->date = empty($this->request->post['date']) ? $date_now : $this->request->post['date'];
            
            // SUBMIT
            if ( $this->model_student_health->save() ):
                echo json_encode( array( "status" => "success" ), JSON_PRETTY_PRINT );
            else:
                echo json_encode( array( "status" => "failed", "message" => "Record Didnt Saved Successfully" ), JSON_PRETTY_PRINT );
            endif;
        endif;
    }
}
?>