function varargout = TreeTrunk(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TreeTrunk_OpeningFcn, ...
                   'gui_OutputFcn',  @TreeTrunk_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


function TreeTrunk_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for TreeTrunk
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Initialize global variable for image data
handles.imgData = [];
handles.croppedImage = [];

% Update handles structure
guidata(hObject, handles);

% Buat axes
ah = axes ('unit', 'normalized', 'position', [0 0 1 1]);
% Import background
bg = imread('Bg.jpg'); imagesc (bg) ;
% Matikan axes dan tampilkan background
set(ah,'handlevisibility', 'off', 'visible', 'off');


function varargout = TreeTrunk_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
% Pilih gambar
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp', 
    'Supported Image Files (*.jpg, *.png, *.bmp)'; '*.*', 
    'All Files (*.*)'}, 'Pilih Gambar');

if filename ~= 0
    % Baca gambar
    handles.imgData = imread(fullfile(pathname, filename));
    
    % Tampilkan gambar sebelum cropping
    axes(handles.axes1);
    imshow(handles.imgData);
    title('Preview','Color','white');
end
    
% Update handles structure
guidata(hObject, handles);


function pushbutton2_Callback(hObject, eventdata, handles)
if isempty(handles.imgData)
    msgbox('Pilih gambar terlebih dahulu.', 'Peringatan', 'warn');
    return;
end

% Tampilkan GUI cropping untuk memilih area cropping
roi = imrect;
wait(roi);

% Dapatkan posisi ROI (Region of Interest)
pos = getPosition(roi); 

% Cropping gambar
handles.croppedImage = imcrop(handles.imgData, pos);

% Tampilkan gambar sesudah cropping
axes(handles.axes2);
imshow(handles.croppedImage);
title('Hasil','Color','white');

% Update handles structure
guidata(hObject, handles);


function pushbutton3_Callback(hObject, eventdata, handles)
% Buat peringatan
if isempty(handles.imgData)
    msgbox('Pilih gambar terlebih dahulu.', 'Peringatan', 'warn');
elseif isempty(handles.croppedImage)
      msgbox('Crop gambar terlebih dahulu.', 'Peringatan', 'warn');  
    return;
end

% Mengonversi ke skala abu-abu
gray_img = rgb2gray(handles.croppedImage);

% Penerapan filter Gaussian untuk mengurangi noise
filtered_img = imgaussfilt(gray_img, 2);

% Mendeteksi tepi menggunakan operator Canny
edge_img = edge(filtered_img, 'Canny');

% Transformasi Hough untuk mendeteksi lingkaran
[centers, radii, metric] = imfindcircles(edge_img, [8, 500]);

% Menampilkan gambar asli
axes(handles.axes2);
imshow(handles.croppedImage);
title('Hasil','Color','white');

% Menandai lingkaran yang berhasil dideteksi
viscircles(centers, radii, 'EdgeColor', 'r');

% Menampilkan jumlah lingkaran yang terdeteksi
num_circles = size(centers, 1);
set (handles.text4, 'String', num2str(num_circles));
