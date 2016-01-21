unit ChartMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, Db, DBTables,
  DbChart, Series, Jpeg, ExtCtrls;

type
  TWebModule1 = class(TWebModule)
    Table1: TTable;
    procedure WebModule1ActionAreaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1ActionPopulationAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1Create(Sender: TObject);
    procedure WebModule1Destroy(Sender: TObject);
    procedure WebModule1AfterDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    Chart: TDBChart;
    Series: TPieSeries;
    Image: TImage;
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

procedure TWebModule1.WebModule1ActionAreaAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  // set specific values
  Chart.Title.Text.Clear;
  Chart.Title.Text.Add ('Area of Countries');
  Chart.LeftAxis.Title.Caption := 'Area';
  Series.Title := 'Area';
  Series.PieValues.ValueSource := 'Area';
end;

procedure TWebModule1.WebModule1ActionPopulationAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  // set specific values
  Chart.Title.Text.Clear;
  Chart.Title.Text.Add ('Population of Countries');
  Chart.LeftAxis.Title.Caption := 'Population';
  Series.Title := 'Population';
  Series.PieValues.ValueSource := 'Population';
end;

procedure TWebModule1.WebModule1Create(Sender: TObject);
begin
  // open the database table
  Table1.Open;
  // create the chart
  Chart := TDBChart.Create (nil);
  Chart.Width := 600;
  Chart.Height := 400;
  Chart.AxisVisible := False;
  Chart.Legend.Visible := False;
  Chart.BottomAxis.Title.Caption := 'Name';
  // create the pie series
  Series := TPieSeries.Create (Chart);
  Series.ParentChart := Chart;
  Series.DataSource := Table1;
  Series.XLabelsSource := 'Name';
  Series.OtherSlice.Style := poBelowPercent;
  Series.OtherSlice.Text := 'Others';
  Series.OtherSlice.Value := 2;
  Chart.AddSeries (Series);
  // create the memory bitmap
  Image := TImage.Create (nil);
  Image.Width := Chart.Width;
  Image.Height := Chart.Height;
end;

procedure TWebModule1.WebModule1Destroy(Sender: TObject);
begin
  Chart.Free;
  Series.Free;
  Image.Free;
end;

procedure TWebModule1.WebModule1AfterDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  Jpeg: TJpegImage;
  MemStr: TMemoryStream;
begin
  // paint the chart on the memory bitmap
  Chart.Draw (Image.Canvas, Image.BoundsRect);
  // create the jpeg and copy the iamge to it
  Jpeg := TJpegImage.Create;
  try
    Jpeg.Assign (Image.Picture.Bitmap);
    MemStr := TMemoryStream.Create;
    // save to a stream and return it
    Jpeg.SaveToStream (MemStr);
    MemStr.Position := 0;
    Response.ContentType := 'image/jpeg';
    Response.ContentStream := MemStr;
    Response.SendResponse;
  finally
    Jpeg.Free;
  end;
end;

end.
