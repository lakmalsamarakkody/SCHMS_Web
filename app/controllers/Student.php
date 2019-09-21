<?php

class Student extends Controller {
    public function index() {
    
        // SITE DETAILS
		$data['app']['url']			= $this->config->get('base_url');
		$data['app']['title']		= $this->config->get('site_title');
		$data['app']['theme']		= $this->config->get('app_theme');

		// HEADER / FOOTER
		$data['template']['header']		= $this->load->controller('common/header', $data);
        $data['template']['footer']		= $this->load->controller('common/footer', $data);
        $data['template']['sidenav']	= $this->load->controller('common/sidenav', $data);
        $data['template']['topmenu']	= $this->load->controller('common/topmenu', $data);

		// RENDER VIEW
        $this->load->view('student/index', $data);
        
    }

    public function search() {
    
        // SITE DETAILS
		$data['app']['url']			= $this->config->get('base_url');
		$data['app']['title']		= $this->config->get('site_title');
		$data['app']['theme']		= $this->config->get('app_theme');

		// HEADER / FOOTER
		$data['template']['header']		= $this->load->controller('common/header', $data);
        $data['template']['footer']		= $this->load->controller('common/footer', $data);
        $data['template']['sidenav']	= $this->load->controller('common/sidenav', $data);
        $data['template']['topmenu']	= $this->load->controller('common/topmenu', $data);

        // MODELS
        $this->load->model('student');
        $this->load->model('class');
        $this->load->model('grade');
        $this->load->model('district');
        $this->load->model('subject');
        $this->load->model('exam');
        $this->load->model('sport');
        $this->load->model('religion');

        //STUDENT CLASS
        foreach( $this->model_class->select('id', 'grade_id', 'staff_id', 'name')->get() as $key => $element ):
            $data['student_class'][$key]['id'] = $element->id;
            $data['student_class'][$key]['grade']['id'] = $element->grade_id;
            $data['student_class'][$key]['staff']['id'] = $element->staff_id;
            $data['student_class'][$key]['name'] = $element->name;

            $data['student_class'][$key]['grade']['name'] = $this->model_grade->select('name')->where('id', '=', $element->grade_id)->first()->name;
        endforeach;

        //GRADE
        foreach( $this->model_grade->select('id', 'name')->get() as $key => $element ):
            $data['student_grade'][$key]['id'] = $element->id;
            $data['student_grade'][$key]['name'] = $element->name;
        endforeach;

        //DISTRICT
        foreach( $this->model_district->select('id', 'province_id', 'name')->get() as $key => $element ):
            $data['student_district'][$key]['id'] = $element->id;
            $data['student_district'][$key]['province']['id'] = $element->province_id;
            $data['student_district'][$key]['name'] = $element->name;
        endforeach;

        //SUBJECT
        foreach( $this->model_subject->select('id', 'name', 'si_name')->get() as $key => $element ):
            $data['student_subject'][$key]['id'] = $element->id;
            $data['student_subject'][$key]['name'] = $element->name;
            $data['student_subject'][$key]['si_name'] = $element->si_name;
        endforeach;

        //EXAM
        foreach( $this->model_exam->select('id', 'type_id','year')->get() as $key => $element ):
            $data['student_exam'][$key]['id'] = $element->id;
            $data['student_exam'][$key]['type_id'] = $element->type_id;
            $data['student_exam'][$key]['year'] = $element->year;
        endforeach;

        //SPORT
        foreach( $this->model_sport->select('id', 'name')->get() as $key => $element ):
            $data['student_sport'][$key]['id'] = $element->id;
            $data['student_sport'][$key]['name'] = $element->name;
        endforeach;

        //RELIGION
        foreach( $this->model_religion->select('id', 'name')->get() as $key => $element ):
            $data['student_religion'][$key]['id'] = $element->id;
            $data['student_religion'][$key]['name'] = $element->name;
        endforeach;

        // CHECK SUBMIT
        if ( isset($this->request->post['isSubmited']) ):

            $student = $this->model_student->select('id', 'full_name', 'city');

            // FILTER ( ADMISSION NO )
            if ( isset($this->request->post['addno']) AND !empty($this->request->post['addno']) ):
                $student->where(function($query) {
                    $query->where('admission_no', '=', $this->request->post['addno']);
                });
            endif;

            // FILTER ( NAME )
            if ( isset($this->request->post['name']) AND !empty($this->request->post['name']) ):
                $student->where(function($query) {
                    $query->where('full_name', 'LIKE', '%'.$this->request->post['name'].'%');
                });
            endif;

            // APPEND DATA TO ARRAY
            foreach( $student->get() as $key => $value ):
                $data['students'][$key]['full_name'] = $value->full_name;
                $data['students'][$key]['city'] = $value->city;
            endforeach;

            // DISPLAY QUERY ( TEMP )
            echo "<pre>";
                var_dump( $student->toSql() );
            echo "</pre>";

        endif;

		// RENDER VIEW
        $this->load->view('student/search', $data);
        
    }
    
    public function add() {
    
        // SITE DETAILS
		$data['app']['url']			= $this->config->get('base_url');
		$data['app']['title']		= $this->config->get('site_title');
		$data['app']['theme']		= $this->config->get('app_theme');

		// HEADER / FOOTER
		$data['template']['header']		= $this->load->controller('common/header', $data);
        $data['template']['footer']		= $this->load->controller('common/footer', $data);
        $data['template']['sidenav']	= $this->load->controller('common/sidenav', $data);
        $data['template']['topmenu']	= $this->load->controller('common/topmenu', $data);

        // MODELS
        $this->load->model('class');
        $this->load->model('grade');
        $this->load->model('staff');
        $this->load->model('subject');
        $this->load->model('religion');
        $this->load->model('district');
        $this->load->model('student/relation');

        //STUDENT CLASS
        foreach( $this->model_class->select('id', 'grade_id', 'staff_id', 'name')->get() as $key => $element ):
            $data['student_class'][$key]['id'] = $element->id;
            $data['student_class'][$key]['grade']['id'] = $element->grade_id;
            $data['student_class'][$key]['staff']['id'] = $element->staff_id;
            $data['student_class'][$key]['name'] = $element->name;

            $data['student_class'][$key]['grade']['name'] = $this->model_grade->select('name')->where('id', '=', $element->grade_id)->first()->name;
        endforeach;

        //RELIGION
        foreach( $this->model_religion->select('id', 'name')->get() as $key => $element ):
            $data['student_religion'][$key]['id'] = $element->id;
            $data['student_religion'][$key]['name'] = $element->name;
        endforeach;

        //DISTRICT
        foreach( $this->model_district->select('id', 'province_id', 'name')->get() as $key => $element ):
            $data['student_district'][$key]['id'] = $element->id;
            $data['student_district'][$key]['province']['id'] = $element->province_id;
            $data['student_district'][$key]['name'] = $element->name;
        endforeach;

        //RELATIONSHIP
        foreach( $this->model_student_relation->select('id', 'name')->get() as $key => $element ):
            $data['student_relation_type'][$key]['id'] = $element->id;
            $data['student_relation_type'][$key]['name'] = $element->name;
        endforeach;

		// RENDER VIEW
        $this->load->view('student/add', $data);
        
    }

    public function ajax_retrive_province_by_district($id) {

        // SET JSON HEADER
        header('Content-Type: application/json');

        // MODEL
        $this->load->model('district');
        $this->load->model('province');

        $province_id = $this->model_district->select('province_id')->where('id', '=', $id)->first()->province_id;

        echo json_encode(array( "status" => "success", "data" => $this->model_province->select('id', 'name')->where('id', '=', $province_id)->first() ));

    }

    public function ajax_add() {

        /**
         * This method will receive ajax request from
         * the front end with the payload
         * 
         *   STUDENT DATA
         *   addno
         *   adddate
         *   class
         *   subject_ids
         *   fn
         *   initials
         *   sn
         *   dob
         *   gen
         *   email
         *   mobno
         *   address
         *   city
         *   dist
         *   province
         *   bp
         *   rel
         * 
         * // GUARDIAN 1ST DATA
         *   g1fn
         *   g1ini
         *   g1sn
         *   g1dob
         *   g1rel
         *   g1gen
         *   g1nic
         *   g1tel
         *   g1mobi
         *   g1occu
         *   g1pos
         *   g1inc
         *   g1mail
         *   g1address
         *   g1city
         *   g1dist
         *   g1province
         * 
         * We need to validate the data and then perform
         * the following tasks.
         *    - validate
         *    - CRUD
         *    - response ( JSON )
         */
        //MODEL
        $this->load->model('student');
        $this->load->model('parent');
        $this->load->model('student/parent');
        $this->load->model('student/class');

        // SET JSON HEADER
        header('Content-Type: application/json');

        // VALIDATION : STUDENT
        // VALIDATION : admission_number
        $is_valid_admission_number = GUMP::is_valid($this->request->post, array('admission_number' => 'numeric|max_len,6'));
        if ( $is_valid_admission_number !== true ):
            echo json_encode( array( "error" => $is_valid_admission_number[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

            // CHECK ADMISSION NUMBER 
            if ( GUMP::is_valid($this->request->post, array('admission_number' => 'required')) === true ):

                // ADMISSION NUMBER IS ENTERED : CHECK FOR DUPLICATE
                if ( $this->model_student->select('id')->where('admission_no', '=', $this->request->post['admission_number'])->first() != NULL ):
                    echo json_encode( array( "error" => "adminission number is already present" ), JSON_PRETTY_PRINT );
                    exit();
                endif;

            // ADMISSION NUMBER IS EMPTY : INCREMENT BY ONE TO THE LAST ADMISSION NUMBER
            else:
                $this->request->post['admission_number'] = $this->model_student->select('admission_no')->orderBy('admission_no', 'DESC')->take(1)->first();
                if ( $this->request->post['admission_number'] ):
                    $this->request->post['admission_number'] = 1;
                else:
                    $this->request->post['admission_number']++;
                endif;                
            endif;

        // VALIDATION : admission_date
        $is_valid_admission_date = GUMP::is_valid($this->request->post, array('admission_date' => 'required|date'));
        if ( $is_valid_admission_date !== true ):
            echo json_encode( array( "error" => $is_valid_admission_date[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : class
        $is_valid_class = GUMP::is_valid($this->request->post, array('class' => 'required|numeric|max_len,3'));
        if ( $is_valid_class !== true ):
            echo json_encode( array( "error" => $is_valid_class[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // // VALIDATION : subject
        // $is_valid_subject = GUMP::is_valid($this->request->post, array('subject' => 'required|numeric|max_len,3'));
        // if ( $is_valid_subject !== true ):
        //     echo json_encode( array( "error" => $is_valid_subject[0] ), JSON_PRETTY_PRINT );
        //     exit();
        // endif;

        // VALIDATION : full_name
        $is_valid_full_name = GUMP::is_valid($this->request->post, array('full_name' => 'required|valid_name|max_len,100'));
        if ( $is_valid_full_name !== true ):
            echo json_encode( array( "error" => $is_valid_full_name[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : initials
        $is_valid_initials = GUMP::is_valid($this->request->post, array('initials' => 'required|alpha_space|max_len,10'));
        if ( $is_valid_initials !== true ):
            echo json_encode( array( "error" => $is_valid_initials[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : surname
        $is_valid_surname = GUMP::is_valid($this->request->post, array('surname' => 'required|valid_name|max_len,20'));
        if ( $is_valid_surname !== true ):
            echo json_encode( array( "error" => $is_valid_surname[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : date_of_birth
        $is_valid_date_of_birth = GUMP::is_valid($this->request->post, array('date_of_birth' => 'required|date'));
        if ( $is_valid_date_of_birth !== true ):
            echo json_encode( array( "error" => $is_valid_date_of_birth[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : gender
        $is_valid_gender = GUMP::is_valid($this->request->post, array('gender' => 'required|contains_list,Male;Female'));
        if ( $is_valid_gender !== true ):
            echo json_encode( array( "error" => $is_valid_gender[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : email
        $is_valid_email = GUMP::is_valid($this->request->post, array('email' => 'valid_email'));
        if ( $is_valid_email !== true ):
            echo json_encode( array( "error" => $is_valid_email[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : mobile_number
        $is_valid_mobile_number = GUMP::is_valid($this->request->post, array('mobile_number' => 'numeric|max_len,10'));
        if ( $is_valid_mobile_number !== true ):
            echo json_encode( array( "error" => $is_valid_mobile_number[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : address
        $is_valid_address = GUMP::is_valid($this->request->post, array('address' => 'required|street_address|max_len,50'));
        if ( $is_valid_address !== true ):
            echo json_encode( array( "error" => $is_valid_address[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : city
        $is_valid_city = GUMP::is_valid($this->request->post, array('city' => 'required|alpha|max_len,20'));
        if ( $is_valid_city !== true ):
            echo json_encode( array( "error" => $is_valid_city[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : district
        $is_valid_district = GUMP::is_valid($this->request->post, array('district' => 'numeric|max_len,2'));
        if ( $is_valid_district !== true ):
            echo json_encode( array( "error" => $is_valid_district[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : birth_place
        $is_valid_birth_place = GUMP::is_valid($this->request->post, array('birth_place' => 'valid_name|max_len,30'));
        if ( $is_valid_birth_place !== true ):
            echo json_encode( array( "error" => $is_valid_birth_place[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : religion
        $is_valid_religion = GUMP::is_valid($this->request->post, array('religion' => 'numeric|max_len,2'));
        if ( $is_valid_religion !== true ):
            echo json_encode( array( "error" => $is_valid_religion[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : FIRST GUARDIAN
        // VALIDATION : first_guardian_full_name
        $is_valid_first_guardian_full_name = GUMP::is_valid($this->request->post, array('first_guardian_full_name' => 'required|valid_name|max_len,100'));
        if ( $is_valid_first_guardian_full_name !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_full_name[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_initials
        $is_valid_first_guardian_initials = GUMP::is_valid($this->request->post, array('first_guardian_initials' => 'required|alpha_space|max_len,10'));
        if ( $is_valid_first_guardian_initials !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_initials[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_surname
        $is_valid_first_guardian_surname = GUMP::is_valid($this->request->post, array('first_guardian_surname' => 'required|valid_name|max_len,20'));
        if ( $is_valid_first_guardian_surname !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_surname[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_date_of_birth
        $is_valid_first_guardian_date_of_birth = GUMP::is_valid($this->request->post, array('first_guardian_date_of_birth' => 'required|date'));
        if ( $is_valid_first_guardian_date_of_birth !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_date_of_birth[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_relation
        $is_valid_first_guardian_relation = GUMP::is_valid($this->request->post, array('first_guardian_relation' => 'required|numeric|max_len,2'));
        if ( $is_valid_first_guardian_relation !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_relation[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_gender
        $is_valid_first_guardian_gender = GUMP::is_valid($this->request->post, array('first_guardian_gender' => 'required|contains_list,Male;Female'));
        if ( $is_valid_first_guardian_gender !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_gender[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_nic
        $is_valid_first_guardian_nic = GUMP::is_valid($this->request->post, array('first_guardian_nic' => "required"));
        if ( $is_valid_first_guardian_nic === true ):
            if ( preg_match("/^([0-9]{9}[x|X|v|V]|[0-9]{12})$/", $this->request->post['first_guardian_nic']) == false ):
                echo json_encode( array( "error" => "Wrong NIC Format" ), JSON_PRETTY_PRINT );
                exit();
            endif;
        else:
            echo json_encode( array( "error" => $is_valid_first_guardian_nic[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_telephone
        $is_valid_first_guardian_telephone = GUMP::is_valid($this->request->post, array('first_guardian_telephone' => 'numeric|max_len,10'));
        if ( $is_valid_first_guardian_telephone !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_telephone[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_mobile_number
        $is_valid_first_guardian_mobile_number = GUMP::is_valid($this->request->post, array('first_guardian_mobile_number' => 'numeric|max_len,10'));
        if ( $is_valid_first_guardian_mobile_number !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_mobile_number[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_occupation
        $is_valid_first_guardian_occupation = GUMP::is_valid($this->request->post, array('first_guardian_occupation' => 'required|valid_name|max_len,50'));
        if ( $is_valid_first_guardian_occupation !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_occupation[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_position
        $is_valid_first_guardian_position = GUMP::is_valid($this->request->post, array('first_guardian_position' => 'valid_name|max_len,50'));
        if ( $is_valid_first_guardian_position !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_position[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_income
        $is_valid_first_guardian_income = GUMP::is_valid($this->request->post, array('first_guardian_income' => 'numeric|max_len,10'));
        if ( $is_valid_first_guardian_income !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_income[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_email
        $is_valid_first_guardian_email = GUMP::is_valid($this->request->post, array('first_guardian_email' => 'valid_email'));
        if ( $is_valid_first_guardian_email !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_email[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_address
        $is_valid_first_guardian_address = GUMP::is_valid($this->request->post, array('first_guardian_address' => 'required|street_address|max_len,50'));
        if ( $is_valid_first_guardian_address !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_address[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_city
        $is_valid_first_guardian_city = GUMP::is_valid($this->request->post, array('first_guardian_city' => 'required|valid_name|max_len,20'));
        if ( $is_valid_first_guardian_city !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_city[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;

        // VALIDATION : first_guardian_district
        $is_valid_first_guardian_district = GUMP::is_valid($this->request->post, array('first_guardian_district' => 'numeric|max_len,2'));
        if ( $is_valid_first_guardian_district !== true ):
            echo json_encode( array( "error" => $is_valid_first_guardian_district[0] ), JSON_PRETTY_PRINT );
            exit();
        endif;


        $this->model_student->admission_no = $this->request->post['admission_number'];
        $this->model_student->admission_date = $this->request->post['admission_date'];
        $this->model_student->class_id = $this->request->post['class'];
        // $this->model_student->subject_id = $this->request->post['subject'];
        $this->model_student->full_name = $this->request->post['full_name'];
        $this->model_student->initials = $this->request->post['initials'];
        $this->model_student->surname = $this->request->post['surname'];
        $this->model_student->dob = $this->request->post['date_of_birth'];
        $this->model_student->gender = $this->request->post['gender'];
        $this->model_student->email = $this->request->post['email'];
        $this->model_student->phone_mobile = $this->request->post['mobile_number'];
        $this->model_student->address = $this->request->post['address'];
        $this->model_student->city = $this->request->post['city'];
        $this->model_student->district_id = $this->request->post['district'];
        $this->model_student->birth_place = $this->request->post['birth_place'];
        $this->model_student->religion_id = $this->request->post['religion'];

        $parent = $this->model_parent->select('id')->where('nic', '=', $this->request->post['first_guardian_nic'])->first();

        if ( $parent !== null ):

            // SUBMIT
            if ( $this->model_student->save() ):    

                // INITIATE : STUDENT HAS PARENT RECORD
                $this->model_student_parent->student_id = $this->model_student->id;
                $this->model_student_parent->parent_id = $parent->id;
                $this->model_student_parent->relation_id = $this->request->post['first_guardian_relation'];

                // CHECK : STUDENT HAS PARENT QUERY
                if ( $this->model_student_parent->save() ):

                    // INITIATE : STUDENT HAS CLASS RECORD
                    $this->model_student_class->stu_id = $this->model_student->id;
                    $this->model_student_class->class_id = $this->request->post['class'];

                    // FETCHING INDEX NO    
                    $index_no = $this->model_student_class->select('index_no')->where('class_id', '=' , $this->request->post['class'])->orderBy('index_no', 'DESC')->take(1)->first();
                    
                    // ASSIGNING INDEX_NO
                    if ( $index_no !== NULL ):
                        $newindex_no = $index_no->index_no + 1;
                        $this->model_student_class->index_no = $newindex_no;
                    else:
                        $this->model_student_class->index_no = 1;
                    endif;

                    // CHECK : STUDENT HAS CLASS QUERY
                    if ( $this->model_student_class->save() ):
                        echo json_encode( array( "status" => "success" ), JSON_PRETTY_PRINT );
                    else:
                        echo json_encode( array( "status" => "failed" ), JSON_PRETTY_PRINT );
                    endif;

                else:
                    echo json_encode( array( "status" => "failed" ), JSON_PRETTY_PRINT );
                endif;

                

            else:
                echo json_encode( array( "status" => "failed" ), JSON_PRETTY_PRINT );
            endif;
            
        else:

            $this->model_parent->full_name = $this->request->post['first_guardian_full_name'];
            $this->model_parent->initials = $this->request->post['first_guardian_initials'];
            $this->model_parent->surname = $this->request->post['first_guardian_surname'];
            $this->model_parent->dob = $this->request->post['first_guardian_date_of_birth'];
            $this->model_parent->gender = $this->request->post['first_guardian_gender'];
            $this->model_parent->nic = $this->request->post['first_guardian_nic'];
            $this->model_parent->phone_home = $this->request->post['first_guardian_telephone'];
            $this->model_parent->phone_mobile = $this->request->post['first_guardian_mobile_number'];
            $this->model_parent->occupation = $this->request->post['first_guardian_occupation'];
            $this->model_parent->position = $this->request->post['first_guardian_position'];
            $this->model_parent->income = $this->request->post['first_guardian_income'];
            $this->model_parent->email = $this->request->post['first_guardian_email'];
            $this->model_parent->address = $this->request->post['first_guardian_address'];
            $this->model_parent->city = $this->request->post['first_guardian_city'];
            $this->model_parent->district_id = $this->request->post['first_guardian_district'];

            // SUBMIT
            if ( $this->model_student->save() AND $this->model_parent->save() ):

                // INITIATE : STUDENT HAS PARENT RECORD
                $this->model_student_parent->student_id = $this->model_student->id;
                $this->model_student_parent->parent_id = $this->model_parent->id;
                $this->model_student_parent->relation_id = $this->request->post['first_guardian_relation'];

                // CHECK : STUDENT HAS PARENT QUERY
                if ( $this->model_student_parent->save() ):

                    // INITIATE : STUDENT HAS CLASS RECORD
                    $this->model_student_class->stu_id = $this->model_student->id;
                    $this->model_student_class->class_id = $this->request->post['class'];

                    $index_no = $this->model_student_class->select('index_no')->where('class_id', '=' , $this->request->post['class'])->orderBy('index_no', 'DESC')->take(1)->first();
                    
                    if ( $index_no !== NULL ):
                        $this->model_student_class->index_no = $index_no->index_no++;
                    else:
                        $this->model_student_class->index_no = 1;
                    endif;

                    // CHECK : STUDENT HAS CLASS QUERY
                    if ( $this->model_student_class->save() ):
                        echo json_encode( array( "status" => "success" ), JSON_PRETTY_PRINT );
                    else:
                        echo json_encode( array( "status" => "failed" ), JSON_PRETTY_PRINT );
                    endif;

                else:
                    echo json_encode( array( "status" => "failed" ), JSON_PRETTY_PRINT );
                endif;

            else:
                echo json_encode( array( "status" => "failed" ), JSON_PRETTY_PRINT );
            endif;

        endif;

        
        
    }
    
}
?>