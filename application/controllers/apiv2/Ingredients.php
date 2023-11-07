<?php
require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Ingredients extends REST_Controller
{

    /**
     * CONSTRUCTOR | LOAD MODEL
     *
     * @return Response
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Product_model');
        $this->load->model('Ingredients_model');
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    }

    /**
     * SHOW | GET method.
     *
     * @return Response
     */

    public function index_get($id = 0)
    {
        // ------- Main Logic part -------
        if (!empty($id)) {
            $data = $this->Ingredients_model->show($id);
            if ($data['status'] == false) {
                $this->response([
                    'message' => 'Data tidak ditemukan.',
                    'data' => []
                ], 200);
            } else {
                $this->response([
                    'message' => "Sukses mengambil data",
                    'data' => $data
                ], 200);
            }
        } else {
            $data = $this->Ingredients_model->show();
            if ($data['status'] == false) {
                $this->response([
                    'message' => 'Data tidak ditemukan.',
                ], 404);
            } else {
                $this->response([
                    'message' => "Sukses mengambil data",
                    'data' => $data
                ], 200);
            }
        }
    }

    /**
     * INSERT | POST method.
     *
     * @return Response
     */
    public function index_post()
    {
        // ------- Main Logic part -------
        $input = $this->_post_args;

        if (!isset($input['product_id'])) {
            $this->response([
                'message' => 'Data tidak lengkap.',
            ], 400);
        } else {
            $product_id = $input['product_id'];

            // Tangani penambahan ingredients
            $ingredients = $input['ingredients'];

            // Siapkan array untuk menyimpan data ingredients
            $batch_data = array();

            foreach ($ingredients as $ingredient) {
                // Tambahkan data ingredients ke array batch
                $ingredient['product_id'] = $product_id;
                $batch_data[] = $ingredient;
            }

            // Gunakan metode insert_batch untuk menyimpan semua data sekaligus
            $insertData = $this->Ingredients_model->insertIngredients($batch_data, $product_id);
            if ($insertData['status'] == false) {
                $this->response([
                    'message' => $insertData['message'],
                ], 400);
            } else {
                $this->response([
                    'message' => $insertData['message'],
                ], 200);
            }
        }
        // ------------- End -------------
    }


    // /**
    //  * UPDATE | PUT method.
    //  *
    //  * @return Response
    //  */
    // public function index_put($id = 0)
    // {
    //     // ------- Main Logic part -------

    //     // $headersz = $this->input->request_headers();
    //     $input = $this->_put_args;
    //     $data['product_name'] = $input['product_name'];
    //     $data['category_id'] = $input['category_id'];
    //     $data['price'] = $input['price'];
    //     $data['quantity'] = $input['quantity'];
    //     $data['description'] = $input['description'];
    //     $response = $this->Product_model->update($data, $id);
    //     if ($response > 0 && $response['status'] == true) {
    //         $data = $this->Product_model->show($id);
    //         $this->response([
    //             'message' => $response['message'],
    //             'data' => $data
    //         ], 200);
    //     } else {
    //         $this->response([
    //             'message' => $response['message'],
    //         ], 400);
    //     }
    //     // ------------- End -------------
    // }

    /**
     * DELETE method.
     *
     * @return Response
     */
    public function index_delete($id)
    {
        // ------- Main Logic part -------
        $response = $this->Product_model->delete($id);

        $response > 0 ? $this->response([
            'message' => 'Product berhasil dihapus.'
        ], 200) :
            $this->response([
                'message' => 'ID Product tidak ditemukan atau salah'
            ], 201);
        // ------------- End -------------
    }
}
