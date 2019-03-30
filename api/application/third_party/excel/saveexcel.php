<?php

$uriPhp =  $_POST['foto'];
// Get content
$binary = file_get_contents($uriPhp);
$array = json_decode($_POST["data"],true);
$time =  time();
$file = 'foto/'.$time.'.jpg';
$excel = 'output/'.$time.".xls";
// Save image
file_put_contents($file, $binary);

ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
ini_set("gd.jpeg_ignore_warning", 1);
/** Include PHPExcel */
require_once 'excel/PHPExcel.php';

//$file = 'foto/'.$_POST['foto'].".jpg";
$objPHPExcel = new PHPExcel(); // Create new PHPExcel object
$objPHPExcel->getProperties()->setCreator("Sigit prasetya n")
                             ->setLastModifiedBy("Sigit prasetya n")
                             ->setTitle("Creating file excel with php Test Document")
                             ->setSubject("Creating file excel with php Test Document")
                             ->setDescription("How to Create Excel file from PHP with PHPExcel 1.8.0 Classes by seegatesite.com.")
                             ->setKeywords("phpexcel")
                             ->setCategory("Test result file");

$objPHPExcel->setActiveSheetIndex(0)->setCellValue("A1", "Laporan Pagu Per Satuan Kerja");
$objPHPExcel->setActiveSheetIndex(0)->setCellValue("A2", "Kementerian Desa, Pembangunan Daerah Tertinggal dan Transmigrasi");
$objPHPExcel->setActiveSheetIndex(0)->setCellValue("A4", "Posisi : 21 Januari 2016");
$style = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        )
    );

$objPHPExcel->setActiveSheetIndex(0)->getStyle("A1:E2")->applyFromArray($style);


// Create Header
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A5', '')
            ->setCellValue('B5', 'Triwulan I')
            ->setCellValue('C5', 'Triwulan II')
			->setCellValue('D5', 'Triwulan III')
            ->setCellValue('E5', 'Triwulan IV');
$default_border = array(
    'style' => PHPExcel_Style_Border::BORDER_THIN,
    'color' => array('rgb'=>'000000')
);			
$style_header = array(
    'borders' => array(
        'bottom' => $default_border,
        'left' => $default_border,
        'top' => $default_border,
        'right' => $default_border,
    ),
    'fill' => array(
        'type' => PHPExcel_Style_Fill::FILL_SOLID,
        'color' => array('rgb'=>'DDDDDD'),
    ),
    'font' => array(
        'bold' => true,
        'size' => 12,
    )
);			
$objPHPExcel->getActiveSheet()->getStyle('A5:E5')->applyFromArray( $style_header ); // give style to header

$firststyle='A2';
$a= 6;
for($i=0;$i<count($array);$i++)
{
    $urut=$i+6;
    $cola='A'.$urut;
    $colb='B'.$urut;
    $colc='C'.$urut;
	$cold='D'.$urut;
	$cole='E'.$urut;
	$a++;
    $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue($cola, "Kinerja ")
            ->setCellValue($colb, $array[$i][0]."%")
            ->setCellValue($colc, $array[$i][1]."%")
			->setCellValue($cold, $array[$i][2]."%")
            ->setCellValue($cole, $array[$i][3]."%");
    //$laststyle=$title;
}
$a=$a+2;
$gdImage = imagecreatefrompng($file);
//$image = imagecreatefrompng($originalFile);
//imagejpeg($gdImage, "foto/test.jpg", "90");
//imagedestroy($image);

$objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
$objDrawing->setName('Sample image');
$objDrawing->setDescription('Sample image');
$objDrawing->setImageResource($gdImage);
$objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_JPEG);
$objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
$objDrawing->setHeight(400);
$objDrawing->setWidth(1000);
$objDrawing->setCoordinates('B'.$a);
$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());

 
// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Product');
// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:P1');
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A2:P2');
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A4:P4');


// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="listproduct.xls"'); // file name of excel
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');
// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0
 
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
//$objWriter->save('php://output');
$objWriter->save($excel);
unlink($file);

echo $time;

?>